cgPlotweb <- function(x,g='genotypes',col.geno=TRUE,lab.cex=1,mean.geno=TRUE){
  if (col.geno){
    col.geno <- rainbow(length(unique(g)))[as.numeric(factor(g))]
    col.geno <- col.geno[apply(x,1,function(x)sum(sign(x)))]
  }else{col.geno <- 'black'}
  if (mean.geno){x <- mean.g(x,g);col.geno <- 'black'}
  x <- x[order(apply(x,1,function(x)sum(sign(x))),decreasing=TRUE),
         order(apply(x,2,function(x)sum(sign(x))),decreasing=TRUE)]
  plotweb(x,method='normal',col.low=col.geno,text.rot=90,labsize=lab.cex)
}