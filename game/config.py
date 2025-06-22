# game/config.py
from pathlib import Path
import shutil
import toml

def get_config_path():
    return Path.home() / ".config" / "geogame" / "config.toml"

def ensure_config_installed():
    target = get_config_path()
    if not target.exists():
        default = Path(__file__).parent / "config.toml"
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy(default, target)

def load_config():
    ensure_config_installed()
    return toml.load(get_config_path())

