#!/usr/bin/env Rscript
rm(list=ls(all=TRUE))
#setwd("C:/Users/hdandu/Desktop/Daimler Part Quality Check/Word2Vec approach")

Sys.setlocale("LC_CTYPE", "japanese")

data1 = readxl::read_xlsx("Validation_CNN_output.xlsx")

data2 = data.frame(do.call('rbind', strsplit(as.character(data1$predictions),',',fixed=TRUE)))
colnames(data2) = c('LOOSE', 'INTERFERENCE', 'LEAKAGE', 'OPEN', 'WEAR', 'DETERIORATION', 'DEFORMATION', 'SOFTWAREERROR', 'POORPERFORMANCE', 'SHORTCIRCUIT', 'PEELINGOFF', 'IMPROPERMAINTENANCE', 'CLOGGING', 'STRESS', 'FAULTYPROCESS', 'INCORRECTMATERIAL', 'INAPPROPRIATEUSAGE', 'MALFUNCTION', 'CRACK', 'HEAT', 'SLIDINGRESISTANCE', 'FIXATION', 'IMPROPERMISSINGSPECIFICATIONS', 'CORROSION')

data3 = data.frame(apply(data2,2,function(x) sapply(strsplit(x,"\\:"), `[`, 2)))
data3$CORROSION = substr(as.character(data3$CORROSION),1,nchar(as.character(data3$CORROSION))-1)

data_fin = cbind(data1[,c("qissue_id","pqr_managing_number","RCA2")],data3)
require(data.table)
data_fin = as.data.table(data_fin)

save(data_fin, file="pred_CNN_validation.RData")

# getAccuracy <- function(x){
#   #x = data_fin
# predTempMelt <- melt(x, id.vars = c("pqr_managing_number","qissue_id","RCA2"))
# predTempMelt = as.data.table(predTempMelt)                            
# predTempMelt$value = as.numeric(predTempMelt$value)
# predTempMelt[, rcaRank := frank(-(value), ties.method = 'first'), by = list(pqr_managing_number,qissue_id)]
# 
# pred_top_5 = predTempMelt[rcaRank %in% 1:5,] 
# pred_top_5$rcaRank = NULL
# 
# pred_top_5 = pred_top_5[,predvar:= list(text = paste(variable, collapse=",")), by = pqr_managing_number]
# 
# predTemp_req = unique(pred_top_5[,c("pqr_managing_number","qissue_id","RCA2","predvar")])
# 
# predTempMatch_count <- predTemp_req[RCA2 %like% predvar,names(predTemp_req), by = list(pqr_managing_number)]
# acc = nrow(predTempMatch_count)/nrow(predTemp_req)
# return(acc)
# }

convert_Qlevel <- function(x){
  #x = data_fin
  finalDF = data.frame()
  for (y in unique(x$qissue_id)){
    #y = "QI201106179004"
    tmp_df = x[x$qissue_id == y,]
    rca = unique(tmp_df$RCA2)
    tmp_df = tmp_df[,c(4:27)]
   # tmp_df <- data.frame(apply(tmp_df,2, as.numeric))
    mean_pred = data.frame(mean=sort(colMeans(tmp_df),decreasing = TRUE))
    top5_mean = head(rownames(mean_pred),5)
    top5_mean = paste(top5_mean, collapse = ',')
  
    max_pred=data.frame(mean=sort(apply(tmp_df,2,max),decreasing = TRUE))
    top5_max = head(rownames(max_pred),5)
    top5_max = paste(top5_max, collapse = ',')

    new=data.frame(y,rca,top5_mean,top5_max)
    new$correct_mean = grepl(rca,new$top5_mean)
    new$correct_max = grepl(rca,new$top5_max)
    finalDF = rbind(finalDF,new)
  }
  return(finalDF)
}

data_fin[,c(4:27)] <- data.frame(apply(data_fin[,c(4:27)],2, as.numeric))
data_fin_qlevel = convert_Qlevel(data_fin)

getAccuracyQ <- function(x){
  #x = data_fin_qlevel
  acc_mean = nrow(x[x$correct_mean == T,])/nrow(x)
  acc_max = nrow(x[x$correct_max == T,])/nrow(x)
  return(c(acc_mean,acc_max))
}

data_fin_qlevel_acc = getAccuracyQ(data_fin_qlevel)
