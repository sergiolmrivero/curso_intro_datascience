library(ggplot2)
data("mpg")

g0 <- ggplot(mpg, aes(hwy,cty))

g1 <- g0 +  geom_point(aes(color=as.factor(cyl))) 

g1a <- g1 + geom_smooth(method="lm")

g1b <- g0 +  geom_point()  +
        facet_grid(.~as.factor(cyl))


g2 <- ggplot(mpg, aes(x=as.factor(cyl), y=hwy)) +
              geom_boxplot()

ggsave(g2, file="g2.png")

g3 <- ggplot(mpg, aes(hwy))

g3a <- g3 + geom_area(stat="bin")
bw = 5
g3b <- g3 + geom_histogram(binwidth = bw)
