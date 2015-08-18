### App Description

This web application uses the USArrests R dataset obtained by:
```{r}
library(datasets)
data(USArrests)
```
The dataset contains crime data for the 50 U.S. states. The following data are provided:

- Assault (per 100,000 residents)  
- Murder (per 100,000 residents)    
- Rape (per 100,000 residents)   
- Urban Population (percent)  

On the **State Crime** tab, select the crime type(s) you are interested in on the left side panel. You can then hover over the resulting map to get the aggregated total crime for each state.

On the **State Urban Population** tab, you can hover over the map to read off the percent of the state population residing in urban areas.  

The **Data** tab shows all data in the USArrests data frame along with the state column appended to it.

Source code is available on [Github!](https://github.com/eideal/DataProducts_CourseProject)


