
# rotoDistance

<!-- badges: start -->
<!-- badges: end -->

The `rotoDistance` package aims to compute the *Procrustes*-based distances, i.e., the *residual*-based and the *rotational*-based. Please refer to ["Andreella, A., De Santis, R., Vesely, A., & Finos, L. (2023). Procrustes-based distances for exploring between-matrices similarity. arXiv preprint arXiv:2301.06164."](https://arxiv.org/abs/2301.06164).

## Installation

You can install the development version of the `rotoDistance` package from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("angeella/rotoDistance")
```

## Example

This is a basic example which shows you how to compute *Procrustes*-based distance matrices. The data used in this example are the ones from ["Andreella, A., De Santis, R., Vesely, A., & Finos, L. (2023). Procrustes-based distances for exploring between-matrices similarity. arXiv preprint arXiv:2301.06164."](https://arxiv.org/abs/2301.06164), i.e., $24$ subjects passively looking at food and no-food (office utensils) images collected by [Smeets, P. A., Kroese, F. M., Evers, C., & de Ridder, D. T. (2013). Allured or alarmed: counteractive control responses to food temptations in the brain. Behavioural brain research, 248, 41-45.](https://www.sciencedirect.com/science/article/pii/S0166432813001824).

### *Residual*-based distance

``` r
library(rotoDistance)
data(FoodData_img_aligned)
data(covFoodData)
```

``` r
out <- procrustesDistanceMatrix(X = FoodData_img_aligned)
```

having this distance matrix, we can apply distance-based techniques such as the multidimensional scaling method:

``` r
library(smacof)
mds_img <- mds(out,type = "mspline", ndim = 11)
db <- cbind(mds_img$conf, covFoodData)
```

``` r
library(tidyverse)
db$ID <- c(1:nrow(db))
db$cycle_phase_covariate <- as.factor(db$cycle_phase_covariate)
db$cycle_phase_covariate <-ifelse(db$cycle_phase_covariate == 0,
                                  "Follicular and Ovulation phase",
                                  ifelse(db$cycle_phase_covariate == 1, "Luteal phase", "Menstrual phase"))
db %>% ggplot(aes_string(x = "D1", y = "D6",
                         label = "ID")) +
  geom_point(aes_string(size = "cycle_phase_covariate",
                        color = "diet_success")) +
  scale_size_manual(values = c(3,5,8), name = "Cycle Phase") +
  scale_color_gradient(low="blue",high="green",
                       name = "Diet success") +
  geom_text()+
  scale_shape_discrete(name = "Post-pre importance") +
  theme_classic() + geom_hline(yintercept = 0, lty = 2) +
  geom_vline(xintercept = 0, lty = 2) +
  theme(text = element_text(size=20)) +
  xlab("1st dimension")+
  ylab("6th dimension")
```


### *Rotational*-based distance

``` r
library(rotoDistance)
data(FoodData_rotation)
data(covFoodData)
```

``` r
out <- procrustesDistanceMatrix(X = FoodData_rotation)
```

having this distance matrix, we can apply distance-based techniques such as the multidimensional scaling method:

``` r
library(smacof)
mds_R <- mds(out,type = "mspline", ndim = 11)
db <- cbind(mds_R$conf, covFoodData)
```

``` r
library(ggplot2)
db$ID <- c(1:nrow(db))
db$cycle_phase_covariate <-ifelse(db$cycle_phase_covariate == 0,
                                  "Follicular and Ovulation phase",
                                  ifelse(db$cycle_phase_covariate == 1, "Luteal phase", "Menstrual phase"))
db %>% ggplot(aes_string(x = "D1", y = "D6",
                         label = "ID")) +
  geom_point(aes_string(size = "cycle_phase_covariate",
                        color = "diet_success")) +
  scale_size_manual(values = c(3,5,8), name = "Cycle Phase") +
  scale_color_gradient(low="blue",high="green",
                       name = "Diet success") +
  geom_text()+
  scale_shape_discrete(name = "Post-pre importance") +
  theme_classic() + geom_hline(yintercept = 0, lty = 2) +
  geom_vline(xintercept = 0, lty = 2) +
  theme(text = element_text(size=20)) +
  xlab("1st dimension")+
  ylab("6th dimension")
```

## References

Andreella, A., De Santis, R., Vesely, A., & Finos, L. (2023). Procrustes-based distances for exploring between-matrices similarity. arXiv preprint arXiv:2301.06164.

## Did you find some bugs?

Please write to angela.andreella[\at]unive[\dot]it or insert a reproducible example using [reprex](https://github.com/tidyverse/reprex) on my [issue github page](https://github.com/angeella/rotoDistance/issues).
