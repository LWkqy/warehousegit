import numpy as np

# Load the EIGENVAL file
eigenval = np.loadtxt('EIGENVAL')

# Extract the energy and k-point data for the spin-up and spin-down bands
energy_up = eigenval[:, 8]
k_points_up = eigenval[:, 0:3]
energy_down = eigenval[:, 9]
k_points_down = eigenval[:, 0:3]

# Find the minimum and maximum energy values for the valence and conduction bands
vbm_energy = max(energy_up[np.where(energy_up < 0)])
cbm_energy = min(energy_up[np.where(energy_up > 0)])

# Find the k-point indices for the valence and conduction bands
vbm_index = np.where(energy_up == vbm_energy)[0][0]
cbm_index = np.where(energy_up == cbm_energy)[0][0]

# Calculate the distance between the k-points at the valence and conduction band extrema
k_distance = np.linalg.norm(k_points_up[cbm_index] - k_points_up[vbm_index])

# Determine if the material has a direct or indirect band gap
if k_distance < 0.1:
    print("This material has a direct band gap.")
else:
    print("This material has an indirect band gap.")