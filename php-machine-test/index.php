<?php
include 'db.php';

$today = date('Y-m-d');

$three_months_ago = date('Y-m-d', strtotime('-3 months'));

$sql = "
    SELECT 
        o.customer_id, 
        c.name AS customer_name, 
        COUNT(o.id) AS total_orders, 
        SUM(o.total_amount) AS total_spent
    FROM 
        orders o
    JOIN 
        customers c ON o.customer_id = c.id
    WHERE 
        o.status != 'canceled'
        AND o.order_date BETWEEN '$three_months_ago' AND '$today'
    GROUP BY 
        o.customer_id
    ORDER BY 
        total_orders DESC, total_spent DESC
    LIMIT 5
";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Top 5 Customers</title>
</head>
<body style="font-family: Arial, sans-serif; padding: 20px;">

<h2 style="text-align: center; color: #333;">Top 5 Customers (Last 3 Months)</h2>

<table style="border-collapse: collapse; width: 70%; margin: 0 auto;">
    <tr>
        <th style="padding: 10px 15px; border: 1px solid #ccc; background-color: #f2f2f2;">Customer ID</th>
        <th style="padding: 10px 15px; border: 1px solid #ccc; background-color: #f2f2f2;">Customer Name</th>
        <th style="padding: 10px 15px; border: 1px solid #ccc; background-color: #f2f2f2;">Total Orders</th>
        <th style="padding: 10px 15px; border: 1px solid #ccc; background-color: #f2f2f2;">Total Spent</th>
    </tr>
    <?php if ($result->num_rows > 0): ?>
        <?php while($row = $result->fetch_assoc()): ?>
        <tr>
            <td style="padding: 10px 15px; border: 1px solid #ccc;"><?php echo htmlspecialchars($row['customer_id']); ?></td>
            <td style="padding: 10px 15px; border: 1px solid #ccc;"><?php echo htmlspecialchars($row['customer_name']); ?></td>
            <td style="padding: 10px 15px; border: 1px solid #ccc;"><?php echo htmlspecialchars($row['total_orders']); ?></td>
            <td style="padding: 10px 15px; border: 1px solid #ccc;"><?php echo htmlspecialchars(number_format($row['total_spent'], 2)); ?></td>
        </tr>
        <?php endwhile; ?>
    <?php else: ?>
        <tr>
            <td colspan="4" style="padding: 10px 15px; border: 1px solid #ccc; text-align: center;">No results found</td>
        </tr>
    <?php endif; ?>
</table>

</body>
</html>

