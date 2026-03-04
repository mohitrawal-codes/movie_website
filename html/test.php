<?php
// Database connection
$servername = "localhost";
$username = "root";  // XAMPP default
$password = "";      // XAMPP default
$dbname = "movies_db";  // CHANGE TO YOUR DB NAME

try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Fetch ALL movies
    $stmt = $pdo->prepare("SELECT title, video_url FROM movies");
    $stmt->execute();
    $movies = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
} catch(PDOException $e) {
    die("DB Error: " . $e->getMessage() . "<br>Check: DB exists? Table 'movies'?");
}
?>
<!DOCTYPE html>
<html>
<head><title>Movie Test</title></head>
<body>
<h1>Testing 20 Movies</h1>
<?php if (empty($movies)): ?>
    <p style="color:red;">❌ No movies found! Check database/table.</p>
<?php else: ?>
    <?php foreach($movies as $movie): ?>
        <div style="margin:20px; border:1px solid #ccc; padding:15px;">
            <h3><?php echo htmlspecialchars($movie['title']); ?></h3>
            <video controls width="400" height="225" preload="metadata">
                <source src="<?php echo htmlspecialchars($movie['video_url']); ?>" type="video/mp4">
                ❌ Video failed to load
            </video>
            <p><small>URL: <?php echo htmlspecialchars($movie['video_url']); ?></small></p>
        </div>
    <?php endforeach; ?>
    <p style="color:green;">✅ All <?php echo count($movies); ?> movies tested!</p>
<?php endif; ?>
</body>
</html>
