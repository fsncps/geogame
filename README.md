# 🌍 GeoGame

A CLI geography quiz.
To keep my memory fit, I made a resolution to memorize all capitals, population and area of the countries of the world, so I made a quiz CLI which will periodically ask me a question. Also suitable to study French vocab or similar if you modify just a bit.

The config lets you select what to be quizzed for (capital, population, area, currency). The results are recorded and when you respond correctly to a question often enough, it will start to be skipped, and questions with high error scores are repeated more often.

---

### Installation

#### Clone the repo and install with pip
```bash
git clone https://github.com/fsncps/geogame.git
cd geogame
pip install -e .
```
---

#### Set up the database
There's a script which creates the MySQL DB and user and imports the schema. Make it executable and run it:
```bash
cd db/
chmod +x setup-db.sh
./setup-db.sh
```
You'll be prompted to set a DB user password. The rest can be changed in the script if desired.

Then, with the info of the DB you created, set an environment variable somewhere (e.g. in ~/.bashrc), called GEOGAME_DB_URL:
```bash
export GEOGAME_DB_URL="mysql+pymysql://geogame_user:your_secure_password@localhost:3306/geogame"
```
---
Now after you refresh the shell, you can start the quiz with `geogame`.

I run it with a 10% chance in every new shell, so in `~/.bashrc` or similar:
```bash
# Run GeoGame with 1/10 probability
if [ $((RANDOM % 10)) -eq 0 ]; then
    geogame
fi
```
---

### Config

On the first run, the default config file is copied to `~/.config/geogame/config.toml`.
In the config file, you can select question content types, set thresholds for error and memorization scores, and limit countries by continent or minimum area and population.

---
<img src="screenshot.png" alt="Demo" width="500"/>

---
### TODO (maybe)
- add evaluation mechanism for questions / data with multiple elements (type 3), like languages or bordering countries
- add commands to output progress / error rates / etc.
- add more data for additional questions (largest city, highest elevation, founded/independence, etc.)

Any contributions welcome.


