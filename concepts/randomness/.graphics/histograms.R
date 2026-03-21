library(tidyverse)
# library(svglite)

n <- 10000
vals <- tibble(
  "SD = 0.5" = rnorm(n, sd = 0.5),
  "SD = 1" = rnorm(n, sd = 1),
  "SD = 2" = rnorm(n, sd = 2)
  )  |>
  pivot_longer(
    cols = starts_with("SD = "),
    names_to = "SD",
    values_to = "value"
  )

# Default theme, bigger text, thicker plot line

set_theme(theme_gray(base_size = 20))
p_light <- vals |>
  ggplot(aes(value)) + 
  geom_freqpoly(
    binwidth = 0.05,
    size = 2) +
  facet_wrap(~SD, ncol = 1) +
  theme(rect = element_rect(fill = "transparent")) +
  theme(legend.position = "none")

ggsave(
  plot = p_light,
  filename = "random_normal-light.svg",
  bg = "transparent"
)

# Dark theme

set_theme(theme_dark(base_size = 20))

p_dark <- vals |>
  ggplot(aes(value)) + 
  geom_freqpoly(
    binwidth = 0.05,
    size = 2) +
  facet_wrap(~SD, ncol = 1) +
  theme(rect = element_rect(fill = "transparent"),
        text = element_text(colour = "white", face = "bold"),
        axis.text = element_text(colour = "white"),
        legend.position = "none")

ggsave(
  plot = p_dark,
  filename = "random_normal-dark.svg",
  bg = "transparent"
)






