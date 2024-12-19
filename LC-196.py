from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import *

ss = SparkSession.builder.appName('duplicate_emails').getORCreate()

email = [
    (1, 'a@gmail.com'),
    (2, 'b@gmail.com'),
    (3, 'a@gmail.com')
]

'''
here the expected output is 
(1, a@gmail.com)
(2, b@gmail.com)
we only fetch the record with min id and delete all other duplicates of this record
'''

emailSchema = StructType([
    StructField('id', IntegerType(), True),
    StructField('email', StringType(), True)
])

email_df = ss.createDataFrame(email, emailSchema)
email_df.show()
rdf = email_df.alias('e1').join(email_df.alias('e2'),col('e1.email')==col('e2.email'), 'left')
rdf.show()
rdf = rdf.filter(col('e1.id')>col('e2.id')).select('e1.id', 'e1.email')
rdf.show()
result = email_df.join(rdf, (email_df.id == rdf.id) & (email_df.email == rdf.email), 'left_anti')
result.show()