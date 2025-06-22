from rapidfuzz.fuzz import ratio

def static_error(correct, user):
    score = ratio(correct.strip().lower(), user.strip().lower())
    return 1 - (score / 100)


def evaluate_answer(test, correct, user_input, config, country):
    try:
        thresholds = config.get("thresholds", {})
        good_threshold = thresholds.get("good", 0.1)
        not_bad_threshold = thresholds.get("not_bad", 0.3)

        if test["type_id"] == 1:  # static
            error = static_error(correct, user_input)
            if error == 0.0:
                msg = "[green]Correct![/green]"
            elif error < not_bad_threshold:
                msg = f"[yellow]Close![/yellow] Correct: {correct} ({round(error * 100)}% off)"
            else:
                msg = f"[red]Wrong![/red] Correct: {correct} ({round(error * 100)}% off)"
            return {"error": error, "message": msg}


        elif test["type_id"] == 2:  # numeric
            try:
                factor = test.get("factor") or 1
                unit_label = test.get("unit") or ""
                correct_full = int(correct)  # unscaled from DB
            except (TypeError, ValueError):
                return {
                    "error": 1.0,
                    "message": "[red]Error: invalid or missing correct answer.[/red]"
                }

            try:
                user_val = int(user_input)
                user_val_full = user_val * factor
            except ValueError:
                return {"error": 1.0, "message": "[red]Invalid input. Please enter a number.[/red]"}

            diff = abs(user_val_full - correct_full)
            rel_error = diff / max(user_val_full, correct_full) if max(user_val_full, correct_full) else 1

            formatted_correct = f"{correct_full:,} {unit_label}".strip()
            label = f"{test['name'].lower()} of {country['country']}"

            # Use absolute diff in user units
            diff_units = abs(user_val - round(correct_full / factor))

            if diff == 0:
                msg = f"[bold green]PERFECT![/bold green] The {label} is [yellow]{formatted_correct}[/yellow]."
            elif diff_units < 1:
                msg = f"[green]Good![/green] The {label} is [yellow]{formatted_correct}[/yellow]. ({round(rel_error * 100)}% off)"
            elif diff_units < 2:
                msg = f"[yellow]Not bad.[/yellow] The {label} is [yellow]{formatted_correct}[/yellow]. ({round(rel_error * 100)}% off)"
            elif rel_error < good_threshold:
                msg = f"[green]Good![/green] The {label} is [yellow]{formatted_correct}[/yellow]. ({round(rel_error * 100)}% off)"
            elif rel_error < not_bad_threshold:
                msg = f"[yellow]Not bad.[/yellow] The {label} is [yellow]{formatted_correct}[/yellow]. ({round(rel_error * 100)}% off)"
            else:
                msg = f"[red]Incorrect.[/red] The {label} is [yellow]{formatted_correct}[/yellow]. ({round(rel_error * 100)}% off)"


            return {"error": rel_error, "message": msg}


        # type_id == 3 and others
        return {"error": 1.0, "message": "[red]This test type is not yet supported.[/red]"}

    except Exception as e:
        return {"error": 1.0, "message": f"[red]Unexpected error: {e}[/red]"}

