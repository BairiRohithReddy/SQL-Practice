# This is pyspark implementation of LC-182

from pyspark.sql.functions import *
from pyspark.sql import *
from pyspark.sql.types import *

ss = SparkSession.builder.appName('email').getOrCreate()

emailSchema = StructType([
    StructField('id', IntegerType(), True),
    StructField('email', StringType(),True)
])

emails = [
    (1, 'a@gmail.com'),
    (2, 'b@gmail.com'),
    (3, 'a@gmail.com')
]

email_df = ss.createDataFrame(emails, emailSchema)
email_df.show()

rdf = email_df.groupBy(col('email'))
rdf = rdf.agg(count(col('id')).alias('count')).filter(col('count')>1)
rdf.select(col('email')).show()