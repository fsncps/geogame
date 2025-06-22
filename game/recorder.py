from sqlalchemy import text

def record_result(db, country, test, user_answer, correct_answer, error):
    db.execute(text("""
        INSERT INTO result (country_id, test_value_id, user_answer, correct_answer, error)
        VALUES (:cid, :tid, :ua, :ca, :err)
    """), {
        "cid": country["id"],
        "tid": test["id"],
        "ua": user_answer,
        "ca": str(correct_answer),
        "err": error
    })

    db.commit()

