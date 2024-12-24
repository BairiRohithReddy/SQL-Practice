-- approach -1
SELECT p.product_name, sum(unit) as unit
FROM Products p 
JOIN Orders o 
ON p.product_id = o.product_id
WHERE LEFT(order_date, 7) = '2020-02'
GROUP BY p.product_id
HAVING unit >= 100;

-- approach -2
SELECT p.product_name, sum(o.unit) AS unit
FROM Products p 
JOIN Orders o 
ON p.product_id = o.product_id
WHERE year(order_date)= 2020 AND month(order_date) = 02
GROUP BY p.product_id
HAVING unit >= 100;

--approach -3
SELECT p.product_name, sum(o.unit) AS unit
FROM Products p 
JOIN Orders o 
ON p.product_id = o.product_id
WHERE order_date >= 2020-02-01 AND order_date <= 2020-02-31
GROUP BY p.product_id
HAVING unit >= 100;


/*

## Date Filtering Approaches in SQL

### 1. Using Integer Functions

```sql
WHERE YEAR(order_date) = 2020 AND MONTH(order_date) = 2
```

- **Performance**: Moderate
- **Index Usage**: Limited
- **Sargability**: Non-sargable
- **Pros**: 
  - Intuitive and easy to read
  - Works well for small to medium-sized datasets
- **Cons**: 
  - Can prevent effective use of indexes
  - Computationally expensive for large datasets

### 2. Using String Literals

```sql
WHERE YEAR(order_date) = '2020' AND MONTH(order_date) = '02'
```

- **Performance**: Poor
- **Index Usage**: Limited
- **Sargability**: Non-sargable
- **Pros**: 
  - Easy to understand
- **Cons**: 
  - Requires implicit type conversion
  - Can severely impact performance on large datasets
  - Prevents effective use of indexes

### 3. Using LEFT Function

```sql
WHERE LEFT(order_date, 7) = '2020-02'
```

- **Performance**: Poor to Moderate
- **Index Usage**: Limited
- **Sargability**: Non-sargable
- **Pros**: 
  - Concise
  - Useful for string-based date formats
- **Cons**: 
  - Function call on column prevents index usage
  - Not suitable for optimized date comparisons

### 4. Using Boundary Conditions

```sql
WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
```

- **Performance**: Excellent
- **Index Usage**: Efficient
- **Sargability**: Sargable
- **Pros**: 
  - Best performance, especially for large datasets
  - Allows effective use of indexes
  - Handles edge cases (e.g., leap years) correctly
- **Cons**: 
  - Requires more careful consideration of date ranges

## Performance Comparison

1. Boundary Conditions: Fastest
2. Integer Functions: Moderate
3. LEFT Function: Slower
4. String Literals: Slowest

The boundary conditions approach is typically 3-10 times faster than the others, especially on large datasets, due to its efficient use of indexes and avoidance of function calls on columns.

## Best Practices

1. Use boundary conditions for optimal performance, especially with large datasets.
2. Avoid functions on columns in WHERE clauses when possible.
3. Be cautious with implicit type conversions.
4. Consider the specific needs of your query and dataset size when choosing an approach.

*/