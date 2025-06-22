import random
from datetime import datetime, timedelta
from sqlalchemy import text

def is_memorized(db, country_id, test_value_id, memorized_threshold):
    cutoff = datetime.now() - timedelta(days=180)
    result = db.execute(text("""
        SELECT COUNT(*) AS attempts, AVG(error) AS avg_error
        FROM result
        WHERE country_id = :cid AND test_value_id = :tid AND created_at > :cutoff
    """), {
        "cid": country_id,
        "tid": test_value_id,
        "cutoff": cutoff,
    }).mappings().first()

    attempts = result["attempts"] or 0
    avg_error = result["avg_error"] or 1.0

    return attempts > 5 and avg_error < (1 - memorized_threshold)

def select_pair(config, db):
    # Step 1: random test
    test_name = random.choice([k for k, v in config["test_values"].items() if v])
    test = db.execute(text("SELECT * FROM test_value WHERE name = :name"),
                      {"name": test_name}).mappings().first()

    # Step 2: random eligible country
    countries = db.execute(text("""
        SELECT * FROM country
        WHERE population >= :min_pop AND area >= :min_area AND continent_id IN (
            SELECT id FROM continent WHERE code IN :continents
        )
    """), {
        "min_pop": config["filters"]["min_population"],
        "min_area": config["filters"]["min_area"],
        "continents": tuple(k for k, v in config["continents"].items() if v),
    }).mappings().all()

    if not countries:
        return None, None

    country = random.choice(countries)

    # Step 3: recursively retry if memorized — unless refresh chance hits
    memorized_threshold = config["thresholds"].get("memorized", 0.95)
    refresh_chance = config["thresholds"].get("refresh_chance", 0.1)  # 10% default

    if is_memorized(db, country["id"], test["id"], memorized_threshold):
        if random.random() >= refresh_chance:
            return select_pair(config, db)  # recurse
    # otherwise: return memorized pair
    return country, test

def format_question(country: dict, test: dict) -> tuple[str, str]:
    """
    Returns: (question_text, correct_answer_raw)
    """
    country_name = country["country"]
    desc = test.get("description", "").rstrip(".")
    unit = test.get("unit")
    col_name = test["col_name"]

    correct = country.get(col_name)
    correct_str = str(correct) if correct is not None else "N/A"

    if unit:
        question_text = f"What is the {desc} of {country_name}?"
    else:
        question_text = f"What is the {desc} of {country_name}?"

    return question_text, correct_str

