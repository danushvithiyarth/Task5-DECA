# Task 5 — Single-image 3D face reconstruction (DECA)

## Method and source

This project uses **DECA (Detailed Expression Capture and Animation)**, the official PyTorch implementation by Feng et al. I selected it because it estimates facial shape, expression, pose, and fine facial detail from one image and can export a textured OBJ mesh. Each photograph is processed independently; the two runs are not fused.

- Original project: <https://github.com/YadiraF/DECA>
- Paper: Feng et al., *Learning an Animatable Detailed 3D Face Model from In-The-Wild Images*, SIGGRAPH 2021, <https://doi.org/10.1145/3450626.3459936>
- License: DECA code and model are provided for non-commercial scientific research; read and comply with the upstream [license](https://github.com/YadiraF/DECA/blob/master/LICENSE).

## Project files

```text
Task5-DECA/
├── README.md
├── .gitignore
├── run_reconstruction.sh
├── inputs/                  # local originals; ignored by Git
└── outputs/
    ├── frontal/             # DECA files from the frontal run
    ├── profile/             # DECA files from the profile run
    └── screenshots/         # add two labelled viewpoints per successful result
```

The original photos are stored locally as `inputs/frontal.png` and `inputs/profile.png`. Keep them out of a public repository; submit the originals separately to ORTUS as required. The images supplied for this run were used without crop, resize, alignment, or other preprocessing. Their backgrounds are neutral, although a wall shadow is visible. The frontal image is 982 × 1288 and the profile image is 950 × 1214.

## Environment

The available computer is an Apple silicon Mac (arm64), macOS 27.2, with system Python 3.13. The upstream project documents Python 3.7 and PyTorch >= 1.6, so system Python 3.13 is not the intended environment. No reconstruction has yet been run in this environment. Use a compatible Linux/Colab runtime or a separate environment supported by the upstream installation instructions; record the actual Python, PyTorch, device/GPU, and OS versions used after a successful run. Do not report the system Python version as the reconstruction environment.

DECA also needs its pretrained DECA weights and FLAME model assets. Obtain them through the links and setup procedure in the [upstream README](https://github.com/YadiraF/DECA#usage) and comply with their access and license terms. These third-party weights/assets are not included here. The optional albedo asset is not required for this assignment.

## Install and run

1. Clone this project, then obtain the official DECA code alongside it:

   ```bash
   git clone https://github.com/YadiraF/DECA.git
   ```

2. Set up DECA using its installation instructions. The upstream README lists the requirements and `bash install_conda.sh`; run `bash fetch_data.sh` from the DECA directory after obtaining any required model access. Check the current upstream instructions because dependencies and asset download links can change.

3. Put the two original images at `inputs/frontal.png` and `inputs/profile.png` (these exact files are ignored by Git).

4. From this directory run:

   ```bash
   ./run_reconstruction.sh
   ```

   The script invokes the upstream `demos/demo_reconstruct.py` once per input, with `--saveDepth True --saveObj True`. Results are expected in the DECA project's `TestSamples/results/`; copy each run's output into `outputs/frontal/` and `outputs/profile/` so the inputs remain clearly separated. To run a single input manually from inside `DECA/`:

   ```bash
   python demos/demo_reconstruct.py -i ../inputs/frontal.png --saveDepth True --saveObj True
   python demos/demo_reconstruct.py -i ../inputs/profile.png --saveDepth True --saveObj True
   ```

   Confirm the exact output options with `python demos/demo_reconstruct.py --help` for the checked-out DECA version.

## Results and analysis

**Status: not yet run.** There are no reconstruction meshes or rendered screenshots in this project yet. Do not treat the input photos or upstream demo images as this project's results. After successful runs, add at least two viewpoints (for example, frontal and side/three-quarter) for each successful input under `outputs/screenshots/`, label every image by input, and update this section from visual inspection.

Use these prompts to document the actual output:

- **Frontal input:** Which eye spacing, nose width, cheek, jaw, and chin proportions look preserved? What changes in the side/three-quarter render?
- **Profile input:** Did detection and reconstruction complete? If not, paste the actual error message or a screenshot, describe the input/settings checked, and state the remaining limitation. Never label the frontal result as a profile reconstruction.
- **Comparison:** Each DECA run sees only its own photograph. A frontal view hides much of the side/back contour; a profile view hides the far side and much of the frontal symmetry. Those regions are model predictions. Note pose, lighting, expression, hair, beard, and shadows where relevant.
- **Accuracy:** Describe visual plausibility separately from geometric accuracy. A smooth or realistic render is not proof of physical dimensions. Do not claim millimetre accuracy without an independent reference. A concrete check would be a calibrated 3D scan or a separate measured photograph from another viewpoint.

## Reproducibility record

Fill this in after running the reconstruction:

| Item | Recorded value |
|---|---|
| DECA commit | TODO |
| Python / PyTorch | TODO |
| OS and device | TODO |
| Command and settings | `./run_reconstruction.sh` (record any changes) |
| Frontal result | TODO: success/failure and output path |
| Profile result | TODO: success/failure and output path |

## Credits and AI assistance

The reconstruction implementation and pretrained models are from the DECA project linked above. This project contains only a small run wrapper and assignment documentation; it does not reimplement or train DECA. OpenAI Codex assisted with organizing this project and drafting the README and wrapper. The student should verify the commands against the installed DECA version, run the method, add their own result analysis/screenshots, and be ready to explain each step.
