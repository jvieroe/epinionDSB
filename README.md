# epinionDSB

*epinionDSB* provides easy-to-use functions for creating visual content ```ggplot2``` package

```
ggplot(mtcars, aes(x = wt,
                   y = mpg)) +
  geom_point(aes(color = id),
             size = 5) +
  scale_color_manual(values = mtcars$hex_code)
```

