# The Frequencies of Coldplay

> A small R analysis that turns Coldplay's musical keys into the **frequencies (Hz)** they actually vibrate at.

![R](https://img.shields.io/badge/R-4.3-276DC3?logo=r&logoColor=white)
![tidyverse](https://img.shields.io/badge/tidyverse-2.0-1A162D?logo=tidyverse&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-14b8a6)

---

## Overview

Spotify reports the **key** of every track as a plain integer (0–11). It's usually
treated as a category — but a key isn't really a category. It's a pitch, and every
pitch is a frequency.

This project converts each Coldplay song's key into the **Hz of its fundamental**,
using standard equal-temperament tuning (A4 = 440 Hz), and explores the result
across two decades of studio albums.

**The question:** *at what frequencies does Coldplay actually vibrate?*

## Repository structure

```
.
├── coldplay_frequencies.Rmd    # the full analysis, start to finish
├── data/
│   └── coldplay_tracks.csv     # key, mode, tempo, energy, valence (2000–2021)
└── README.md
```

## What the analysis covers

| Section | Question |
|---|---|
| **Frequency fingerprint** | Where does every track sit on the Hz axis? |
| **Most-used fundamentals** | Which frequencies does Coldplay return to? |
| **432 vs 440 Hz** | What changes under a different reference tuning? |
| **Drift over time** | Has the average fundamental moved across albums? |

## Method

Each pitch class is mapped to a frequency with the equal-temperament formula,
anchored to A4 = 440 Hz:

```
f = 440 × 2^(n / 12)
```

where `n` is the number of semitones from A. So A = 440 Hz, C ≈ 261.63 Hz, E ≈ 329.63 Hz, and so on.

## A few findings

- Coldplay's most-used fundamentals are **E (330 Hz)** and **A (440 Hz)**.
- Minor keys cluster around the slower, more acoustic tracks.
- The catalogue's mean fundamental drifts only slightly across 20 years.

## Running it

Open the notebook in RStudio and knit, or from the command line:

```r
rmarkdown::render("coldplay_frequencies.Rmd")
```

**Requirements:** `tidyverse`, `rmarkdown`

## Data

Audio features (key, mode, tempo, energy, valence) from Spotify's audio analysis.
Frequencies derived from equal-temperament tuning with A4 = 440 Hz.

## License

MIT
