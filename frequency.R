# frequency.R
# Helpers for converting musical keys into frequencies (Hz).
#
# Every pitch is a frequency. Using equal-temperament tuning with A4 = 440 Hz,
# any note n semitones away from A vibrates at 440 * 2^(n/12).

# Pitch-class names, following Spotify's notation (0 = C ... 11 = B)
pitch_names <- c("C", "C#", "D", "D#", "E", "F",
                 "F#", "G", "G#", "A", "A#", "B")

#' Convert a pitch class (0-11) to the frequency of its fundamental, in Hz.
#'
#' Anchored to A (pitch class 9) = 440 Hz.
#'
#' @param key Integer pitch class, 0 (C) to 11 (B).
#' @param reference Reference frequency for A, in Hz (default 440).
#' @return Frequency in Hz.
key_to_hz <- function(key, reference = 440) {
  semitones_from_a <- key - 9
  reference * 2^(semitones_from_a / 12)
}

#' Give the name of a pitch class.
#'
#' @param key Integer pitch class, 0 (C) to 11 (B).
#' @return Character, e.g. "A", "C#".
key_name <- function(key) {
  pitch_names[key + 1]
}

# Quick sanity check when the script is run directly:
#   A  should be 440 Hz
#   C  should be ~261.63 Hz
if (sys.nframe() == 0) {
  for (k in 0:11) {
    cat(sprintf("%-3s -> %7.2f Hz\n", key_name(k), key_to_hz(k)))
  }
}
