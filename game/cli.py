from game.db import get_db
from game.config import load_config
from game.question import select_pair, format_question
from game.evaluate import evaluate_answer
from game.recorder import record_result
from rich.prompt import Prompt
from rich import print

def ask_question():
    config = load_config()
    with next(get_db()) as db:
        country, test = select_pair(config, db)

        if not test or not country:
            print("[red]No valid question found.[/red]")
            return

        question_text, correct_answer = format_question(country, test)
        user_input = Prompt.ask(question_text)
        result = evaluate_answer(test, correct_answer, user_input, config, country)
        record_result(db, country, test, user_input, correct_answer, result["error"])
        print(result["message"])

def main():
    print("[bold cyan]Welcome to the GeoGame Quiz![/bold cyan]")
    while True:
        ask_question()
        cont = Prompt.ask("Another question? (y/n)", choices=["y", "n"], default="y")
        if cont == "n":
            break

