FROM rocker/r-ver:4.0.0
RUN install2.r broom
RUN install2.r dplyr
RUN install2.r magrittr
