#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DECA_DIR="${DECA_DIR:-$ROOT/DECA}"

if [[ ! -d "$DECA_DIR" ]]; then
  echo "DECA checkout not found at: $DECA_DIR" >&2
  echo "Clone https://github.com/YadiraF/DECA there, then follow its model setup instructions." >&2
  exit 2
fi
for photo in "$ROOT/inputs/frontal.png" "$ROOT/inputs/profile.png"; do
  if [[ ! -f "$photo" ]]; then
    echo "Required input missing: $photo" >&2
    exit 2
  fi
done

cd "$DECA_DIR"
python demos/demo_reconstruct.py -i "$ROOT/inputs/frontal.png" --saveDepth True --saveObj True
python demos/demo_reconstruct.py -i "$ROOT/inputs/profile.png" --saveDepth True --saveObj True

echo "Both single-image runs finished. Review TestSamples/results/ in the DECA checkout."
echo "Copy each result to $ROOT/outputs/frontal and $ROOT/outputs/profile, respectively."
