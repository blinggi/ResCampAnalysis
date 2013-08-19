## put labels and conditions (transpose so columns are genes, rows are conditions)
# input : imported csv file
# output: data frame with factors and gene names  

#export coded names, can match up then reimport
write.csv(RNA.seqV2.biofuels.July2013export[1,],'./munge/coded.names.csv')
# need to have genes as col, conditions as rows. this allows adding factors, otherwise is problatic
decoded =read.csv('./munge/coded_decodes.names.csv')
attach(RNA.seqV2.biofuels.July2013export)
data = data.frame(t(RNA.seqV2.biofuels.July2013export[,2:25]))
colnames(data)=Gene.Symbol

# add conditions as factors as a col
condition.factors =as.factor(t(decoded[2,3:26]))
data.w.conds = cbind(condition.factors,data)
detach(RNA.seqV2.biofuels.July2013export)
rm(RNA.seqV2.biofuels.July2013export)
rm(data)
rm(decoded)
attach(data.w.conds)



