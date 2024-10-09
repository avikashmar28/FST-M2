inputFile = LOAD 'hdfs:///user/root/Avik_Ash/file01.txt' AS (line);
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
grpd = GROUP words BY word;
cntd = FOREACH grpd GENERATE group, COUNT(words);
rmf hdfs:///user/root/Avik_Ash/PigResult;
STORE cntd INTO 'hdfs:///user/root/PigResult';