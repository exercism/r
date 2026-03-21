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

set_theme(theme_gray(base_size = 24))
p <- vals |>
  ggplot(aes(value)) + 
  geom_freqpoly(
    binwidth = 0.05,
    size = 2) +
  facet_wrap(~SD, ncol = 1) +
  theme(rect = element_rect(fill = "transparent")) +
  theme(legend.position = "none")

ggsave(
  plot = p,
  filename = "random_normal.svg",
  bg = "transparent"
)

# Dark theme

set_theme(theme_dark(base_size = 24))

p_dark <- vals |>
  ggplot(aes(value)) + 
  geom_freqpoly(
    binwidth = 0.05,
    size = 2,
    color = "white") +
  facet_wrap(~SD, ncol = 1) +
  theme(rect = element_rect(fill = "transparent"),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel background
        plot.background = element_rect(fill = "transparent", colour = NA),  # Transparent plot background
        text = element_text(colour = "white", face = "bold"),
        axis.text = element_text(colour = "white"),
        strip.text = element_text(
        size = 28,      # Adjust the font size as needed
        face = "bold"   # Set the font face to bold
        ),
        legend.position = "none")

ggsave(
  plot = p_dark,
  filename = "random_normal-dark.svg",
  bg = "transparent"
)


# Light theme

set_theme(theme_light(base_size = 24))

p_light <- vals |>
  ggplot(aes(value)) + 
  geom_freqpoly(
    binwidth = 0.05,
    size = 2) +
  facet_wrap(~SD, ncol = 1) +
  theme(rect = element_rect(fill = "transparent"),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel background
        plot.background = element_rect(fill = "transparent", colour = NA),  # Transparent plot background
        strip.text = element_text(
        size = 28,      # Adjust the font size as needed
        face = "bold"   # Set the font face to bold
        ),
        legend.position = "none")

ggsave(
  plot = p_light,
  filename = "random_normal-light.svg",
  bg = "transparent"
)






