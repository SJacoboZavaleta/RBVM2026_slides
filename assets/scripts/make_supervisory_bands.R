library(ggplot2)
library(tibble)
library(dplyr)
library(scales)

# -----------------------------
# Conceptual supervisory-band plot
# -----------------------------
eps_dead <- 2.0

t <- seq(0, 10, length.out = 500)
theta_ref <- 90 + 6.5 * sin(2 * pi * t / 8 + 0.15)

df <- tibble(
  t = t,
  ref = theta_ref,
  upper = theta_ref + eps_dead,
  lower = theta_ref - eps_dead
)

y_min <- min(df$lower) - 2.0
y_max <- max(df$upper) + 2.0

ggplot(df, aes(x = t)) +

  # -----------------------------
  # Supervisory regions
  # -----------------------------
  geom_ribbon(aes(ymin = upper, ymax = y_max),
              fill = alpha("#FF0066", 0.16)) +   # FLEX region

  geom_ribbon(aes(ymin = lower, ymax = upper),
              fill = alpha("#008000", 0.14)) +   # IDLE band

  geom_ribbon(aes(ymin = y_min, ymax = lower),
              fill = alpha("#0088AA", 0.16)) +   # EXT region

  # -----------------------------
  # Reference and band limits
  # -----------------------------
  geom_line(aes(y = ref),
            color = "#02577B",
            linewidth = 1.15) +

  geom_line(aes(y = upper),
            color = alpha("#02577B", 0.55),
            linewidth = 0.7,
            linetype = "22") +

  geom_line(aes(y = lower),
            color = alpha("#02577B", 0.55),
            linewidth = 0.7,
            linetype = "22") +

  # -----------------------------
  # Labels
  # -----------------------------
  annotate("label",
           x = 5.5, y = y_max - 4.0,
           label = "FLEX",
           size = 5.0,
           label.size = 0.15,
           fill = alpha("#FFFFFF", 0.65),
           color = "#D10057",
           fontface = "bold") +

  annotate("label",
           x = 2.0, y = mean(range(df$ref)),
           label = "IDLE\n|e| ≤ ε_dead",
           size = 5,
           label.size = 0.15,
           fill = alpha("#FFFFFF", 0.65),
           color = "#0A6A0A",
           fontface = "bold") +

  annotate("label",
           x = 8.0, y = y_min + 2.0,
           label = "EXT",
           size = 5,
           label.size = 0.15,
           fill = alpha("#FFFFFF", 0.65),
           color = "#006F8A",
           fontface = "bold") +

  # -----------------------------
  # Axes
  # -----------------------------
  labs(
    x = "Time (s)",
    y = expression(theta~"(deg)")
  ) +

  coord_cartesian(
    xlim = c(min(t), max(t)),
    ylim = c(y_min, y_max),
    expand = FALSE,
    clip = "off"
  ) +

  theme_minimal(base_size = 14, base_family = "sans") +
  theme(
    legend.position = "none",

    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = alpha("#243238", 0.08), linewidth = 0.4),

    axis.title = element_text(color = "#102626", size = 12.5),
    axis.text = element_text(color = "#243238", size = 11.5),

    # =====================================================
    # THESE TWO LINES CONTROL WHITE VS TRANSPARENT BACKGROUND
    # =====================================================
    plot.background  = element_rect(fill = "transparent", color = NA),
    panel.background = element_rect(fill = "transparent", color = NA),

    # Optional cleanup
    legend.background = element_rect(fill = "transparent", color = NA),
    plot.margin = margin(6, 10, 4, 4)
  )

ggsave(
  filename = "assets/figures/supervisory_bands.svg",
  plot = last_plot(),
  width = 7.2,
  height = 4.1,
  bg = "transparent"
)