# rice-irrigation-requirements-remotesensing
Using remote sensing imagery with remote sensing indices and R programming to calculate rice irrigation requirements
This project employs cutting-edge remote sensing trends to calculate the rice irrigation requirements for an irrigation system in the growing season of 2023.
All plots were done using R GGPLOT library.

This project had the following objectives:

1.  To investigate the relationship between water variation and health variation of rice.
2.  To estimate the amount and distribution of irrigation needs for rice in each growing stage.
3.  To estimate the spatial distribution of water deficits in each growing stage within the scheme.

To achieve these objectives, a stepwise approach was employed as follows:
- Downloading Sentinel2 imagery
- Calculating remote sensing indices for each growing stage(NDVI and NDMI)

These were the results from this step:
![NDVI_plot](https://github.com/user-attachments/assets/1e1e8944-94aa-4bad-8d07-f6729d6d2f16)
![NDMI_plot](https://github.com/user-attachments/assets/cd98c002-d7b8-463f-ba98-010c99e5ef89)

- Plotting a Bland Altman graph to investigate the correlation between NDVI(signifying health of rice), and NDMI(signifying amount of water)
The Bland Altman plots showing the correlation between amount of water in the field(NDMI) and health of the rice(NDVI) for each growing stage were as follows:
![blandplot1](https://github.com/user-attachments/assets/9a787da7-9cb4-4fd3-a612-1799c312b72e)
![blandplot2](https://github.com/user-attachments/assets/524ab35f-68a7-487d-8ff1-8fee6ab85525)
![blandplot3](https://github.com/user-attachments/assets/dd9d7197-02b3-4f8d-9adc-2593ba85e2b2)
![blandplot4](https://github.com/user-attachments/assets/31534828-13f5-41d3-b3eb-f36cfc855db4)

- Obtaining temperature, rainfall, and water layer data
- Calculating extratterestial radiation
- Calculating FAO reference evapotranspiration
- Calculating crop coefficients for each rice growing stage from NDVI, which is a remote sensing indicator of overall wellness of a plant. This was the result:
![Crop_coefficients_plot](https://github.com/user-attachments/assets/7cc27b7e-562f-4bcf-9bc1-11ceec2dfffc)

- Multiplying reference evapotranspiration with crop coefficients to obtain crop evapotranspiration, which resulted in this:
![Crop_Evapotranspiration_plot](https://github.com/user-attachments/assets/245b16a4-807f-47c1-ac7b-d7ee1ddbdee5)

- Calculating the effective rainfall
- Using all these pre-obtained variable to calculate the irrigation needs using Hagreaves-Samani methodology
![Irrigation_needs_plot](https://github.com/user-attachments/assets/26d760d1-1953-429d-a54c-870512e96956)


And finally:
- Calculating water deficits by subtracting the optimal required irrigation water from the amount of water input into the farm in each growing epoch
![Water_deficits_plot](https://github.com/user-attachments/assets/dcedb756-8139-4376-bb5d-92140fb6c225)


