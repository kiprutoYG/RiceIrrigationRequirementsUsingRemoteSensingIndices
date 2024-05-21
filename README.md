# rice-irrigation-requirements-remotesensing
Using remote sensing imagery with remote sensing indices and R programming to calculate rice irrigation requirements
This project employs cutting-edge remote sensing trends to calculate the rice irrigation requirements for an irrigation system in the growing season of 2023.

This project had the following objectives:

1.  To investigate the relationship between water variation and health variation of rice.
2.  To estimate the amount and distribution of irrigation needs for rice in each growing stage.
3.  To estimate the spatial distribution of water deficits in each growing stage within the scheme.

To achieve these objectives, a stepwise approach was employed as follows:
- Downloading Sentinel2 imagery
- Calculating remote sensing indices(NDVI and NDMI)
- Plotting a Bland Altman graph to investigate the correlation between NDVI(signifying health of rice), and NDMI(signifying amount of water)
This solves the first objective

- Obtaining temperature, rainfall, and water layer data
- Calculating extratterestial radiation
- Calculating FAO reference evapotranspiration
- Calculating crop coefficients for each rice growing stage using NDVI maps
- Multiplying reference evapotranspiration with crop coefficients to obtain crop evapotranspiration
- Calculating the effective rainfall
- Using all these pre-obtained variable to calculate the irrigation needs using Hagreaves-Samani methodology
This solves the second objective

- Calculating water deficits by subtracting the optimal required irrigation water from the amount of water input into the farm in each growing epoch
Solves the final objective
