my_list <- list(a=1, b=3, c=5, d=7)
elt_b <- my_list$b
elts_1_to_3 <- my_list[1:3]

double_each <- function(int_list) {
  sapply(int_list, function(x) {x*2})
}
elts_1_to_3_doubled <- double_each(elts_1_to_3)
