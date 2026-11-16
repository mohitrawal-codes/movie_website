<?php
include("../php/db.php");

$sql_carousel = "SELECT * FROM movies ORDER BY rating DESC LIMIT 10";
$carousel_result = $conn->query($sql_carousel);
$carousel_movies = [];
if ($carousel_result) {
    while ($row = $carousel_result->fetch_assoc()) { $carousel_movies[] = $row; }
    $carousel_result->free();
}

$sql = "SELECT * FROM movies ORDER BY title";
$result = $conn->query($sql);
if (!$result) { die("Database error: " . htmlspecialchars($conn->error)); }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CineArchive — Public Domain Classics</title>
  <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

  <header class="site-header">
    <div class="header-top-rule"></div>
    <div class="header-inner">
      <div class="header-ornament">&#9670;</div>
      <h1 class="site-title">CineArchive</h1>
      <div class="header-ornament">&#9670;</div>
    </div>
    <p class="site-subtitle">25 Public Domain Masterpieces</p>
    <div class="header-bottom-rule">
      <span></span><span class="rule-diamond">&#10022; &#9670; &#10022;</span><span></span>
    </div>
  </header>

  <?php if (!empty($carousel_movies)): ?>
  <section class="hero-carousel">
    <div class="carousel-track">
      <?php foreach ($carousel_movies as $index => $movie): ?>
        <div class="carousel-slide <?php echo $index === 0 ? 'active' : ''; ?>">
          <div class="slide-poster">
            <img src="<?php echo htmlspecialchars($movie['poster_url'] ?? '../images/no-poster.jpg'); ?>"
                 alt="<?php echo htmlspecialchars($movie['title']); ?>"
                 class="slide-img"
                 onerror="this.src='../images/no-poster.jpg'">
            <div class="slide-poster-glow"></div>
          </div>
          <div class="slide-info">
            <div class="slide-badge">&#9733; Top Rated</div>
            <h2 class="slide-title"><?php echo htmlspecialchars($movie['title']); ?></h2>
            <div class="slide-meta">
              <?php if (!empty($movie['year'])): ?>
                <span class="meta-tag"><?php echo intval($movie['year']); ?></span>
              <?php endif; ?>
              <?php if (!empty($movie['genre'])): ?>
                <span class="meta-tag"><?php echo htmlspecialchars($movie['genre']); ?></span>
              <?php endif; ?>
              <?php if (!empty($movie['rating'])): ?>
                <span class="meta-tag meta-rating">&#9733; <?php echo number_format((float)$movie['rating'], 1); ?>/10</span>
              <?php endif; ?>
            </div>
            <?php if (!empty($movie['description'])): ?>
              <p class="slide-desc"><?php echo htmlspecialchars(substr($movie['description'], 0, 220)); ?>...</p>
            <?php endif; ?>
            <a href="movie.php?id=<?php echo intval($movie['id']); ?>" class="slide-btn">&#9654; Watch Now</a>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
    <div class="carousel-dots">
      <?php foreach ($carousel_movies as $index => $m): ?>
        <button class="dot <?php echo $index === 0 ? 'active' : ''; ?>" data-index="<?php echo $index; ?>"></button>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <main class="main-content">
    <div class="section-header">
      <div class="sh-rule"><span></span><span class="sh-icon">&#127902;</span><span></span></div>
      <h2 class="section-title">The Complete Collection</h2>
      <p class="section-sub">All films freely available from the public domain archive</p>
    </div>

    <div class="movie-grid">
      <?php while ($row = $result->fetch_assoc()): ?>
        <article class="movie-card">
          <a href="movie.php?id=<?php echo intval($row['id']); ?>" class="card-poster-link">
            <div class="card-poster-wrap">
              <img src="<?php echo htmlspecialchars($row['poster_url'] ?? '../images/no-poster.jpg'); ?>"
                   alt="<?php echo htmlspecialchars($row['title']); ?>"
                   class="card-poster"
                   loading="lazy"
                   onerror="this.src='../images/no-poster.jpg'">
              <div class="card-overlay"><span class="overlay-play">&#9654;</span></div>
            </div>
          </a>
          <div class="card-body">
            <h3 class="card-title">
              <a href="movie.php?id=<?php echo intval($row['id']); ?>"><?php echo htmlspecialchars($row['title']); ?></a>
            </h3>
            <div class="card-meta">
              <?php if (!empty($row['year'])): ?><span><?php echo intval($row['year']); ?></span><?php endif; ?>
              <?php if (!empty($row['genre'])): ?><span class="card-dot">&middot;</span><span><?php echo htmlspecialchars($row['genre']); ?></span><?php endif; ?>
            </div>
            <?php if (!empty($row['description'])): ?>
              <p class="card-desc"><?php echo htmlspecialchars(substr($row['description'], 0, 110)); ?>...</p>
            <?php endif; ?>
            <a href="movie.php?id=<?php echo intval($row['id']); ?>" class="card-btn">Watch Now</a>
          </div>
        </article>
      <?php endwhile; ?>
    </div>
  </main>

  <footer class="site-footer">
    <div class="footer-rule">
      <span></span><span>&#10022; CineArchive &#10022;</span><span></span>
    </div>
    <p>&copy; 2026 CineArchive &nbsp;|&nbsp; BSc CS Mumbai University Project</p>
    <p class="footer-sub">All films are in the public domain &middot; Sourced from archive.org</p>
  </footer>

  <script>
    const slides = document.querySelectorAll('.carousel-slide');
    const dots   = document.querySelectorAll('.dot');
    let current  = 0, timer;

    function goTo(n) {
      slides[current].classList.remove('active');
      dots[current].classList.remove('active');
      current = (n + slides.length) % slides.length;
      slides[current].classList.add('active');
      dots[current].classList.add('active');
    }

    function startAuto() { timer = setInterval(() => goTo(current + 1), 5500); }
    function stopAuto()  { clearInterval(timer); }

    if (slides.length > 1) {
      startAuto();
      dots.forEach(dot => dot.addEventListener('click', () => {
        stopAuto(); goTo(parseInt(dot.dataset.index)); startAuto();
      }));
    }
  </script>
</body>
</html>
<?php $result->free(); $conn->close(); ?>
