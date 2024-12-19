from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import *

ss = SparkSession.builder.appName('customers').getOrCreate()

custSchema = StructType([
    StructField('id', IntegerType(), True),
    StructField('name', StringType(), True)
])

orderSchema = StructType([
    StructField('id', IntegerType(), True),
    StructField('customerId', IntegerType(), True)
])

cust = [
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Max'),
    (4, 'Sam')
]

order = [
    (1, 3),
    (2, 1)
]

cust_df = ss.createDataFrame(cust, custSchema)
order_df = ss.createDataFrame(order, orderSchema)

rdf = cust_df.alias('c').join(order_df.alias('o'), col('c.id')==col('o.customerId'), 'left')
rdf.show()
rdf = rdf.filter(col('o.id').isNull())
rdf.select(col('name').alias('customers')).show()