# This is a Pyspark implementation of LC-181

from Pyspark.sql import *
from Pyspark.sql.functions import *
from Pyspark.sql.types import *

empSchema = StructType([
    StructField('id', IntergerType(), True),
    StructField('name', StringType(), True),
    StructField('salary', IntegerType(), True),
    StructField('managerid', IntegerType(), True)
])

emp = [
    (1, 'Joe', 7000, 3 ),
    (2, 'Henry', 8000, 4),
    (3, 'Sam', 6000, None),
    (4, 'Max', 9000, None)
]

ss = SparkSession.builder.appName('employee').getOrCreate()
emp_df = ss.CreateDataFrame(emp, empSchema)
emp_df.show()

rdf = ss.emp_df.alias('e1').join(emp_df.alias('e2'),col('e1.managerid')==col('e2.id'))
rdf = ss.filter(col('e1.salary')>col('e2.salary'))
rdf.select(col('e1.name').alias('Employee')).show()