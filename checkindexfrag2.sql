SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique,
    i.is_primary_key,
    i.is_unique_constraint,
    i.fill_factor,
    i.has_filter,
    i.filter_definition,
    i.is_disabled,
    ic.index_column_id,
    col.name AS ColumnName,
    ic.is_included_column
FROM 
    sys.indexes i
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
WHERE 
    OBJECT_NAME(i.object_id) IN ('SalesOrderDetail', 'SalesOrderHeader')
ORDER BY 
    TableName, IndexName, ic.index_column_id;
