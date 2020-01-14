install.packages(c('devtools', 'gam', 'RColorBrewer', 'BiocManager'),repos="https://cloud.r-project.org/")
update.packages(ask=F)
BiocManager::install(c("scran","MAST","monocle","ComplexHeatmap","slingshot"))
