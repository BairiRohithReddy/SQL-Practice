SELECT *
FROM Patients
WHERE conditions LIKE '% DIAB1%' or conditions LIKE 'DIAB1%';

SELECT *
FROM Patients
WHERE REGEXP '\\bDIAB1'

/*


1. Original REGEXP approach:
   ```sql
   SELECT *
   FROM Patients
   WHERE conditions REGEXP '\\bDIAB1'
   ```

   - `\\b`: Represents a word boundary in SQL REGEXP.
   - This matches 'DIAB1' at the start of the string or after a space.
   - It will also match 'DIAB1' followed by other characters (e.g., 'DIAB120').

2. Limitation:
   - Fails to match 'ACNE +DIAB1' because '+' is not considered a word boundary.

3. Improved REGEXP approach:
   ```sql
   SELECT *
   FROM Patients
   WHERE conditions REGEXP '(^|[[:space:]])DIAB1'
   ```

   - `^`: Matches the start of the string.
   - `[[:space:]]`: Matches any whitespace character.
   - `(^|[[:space:]])`: Matches either the start of the string or any whitespace.
   - This correctly handles cases like 'ACNE +DIAB1'.

### Original LIKE Approach

```sql
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
```

- This approach correctly handles both 'DIAB1' at the start and after a space.
- It also works for the 'ACNE +DIAB1' case.

*/