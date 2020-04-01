## High and Low Bounds

IBS$Lymphocytes_result[IBS$Lymphocytes > 54] <- "HIGH"

IBS$Lymphocytes_result[IBS$Lymphocytes <= 19 & IBS$Lymphocytes >= 53] <- "NORMAL"

IBS$Lymphocytes_result[IBS$Lymphocytes < 18] <- "LOW"