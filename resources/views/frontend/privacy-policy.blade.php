<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $CmsPage->title }} - RemyndNow</title>
    <link href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;700&family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8950FC;
            --primary-light: #f3f0ff;
            --text-dark: #181C32;
            --text-muted: #5E6278;
            --bg-body: #f8f9fc;
            --bg-card: #ffffff;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--bg-body);
            color: var(--text-dark);
            line-height: 1.6;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
            animation: fadeInDown 0.8s ease-out;
        }

        .logo {
            font-family: 'Cabin', sans-serif;
            font-weight: 700;
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(135deg, #8950FC 0%, #6993FF 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .card {
            background: var(--bg-card);
            border-radius: 24px;
            padding: 50px;
            box-shadow: var(--shadow);
            border: 1px solid rgba(0,0,0,0.03);
            animation: fadeInUp 1s ease-out;
        }

        h1 {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--text-dark);
            border-bottom: 2px solid var(--primary-light);
            padding-bottom: 15px;
        }

        .content {
            font-size: 1.1rem;
            color: var(--text-muted);
            white-space: pre-wrap; /* Preserves line breaks from DB */
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9rem;
            color: var(--text-muted);
            opacity: 0.7;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .card {
                padding: 30px 20px;
            }
            h1 {
                font-size: 1.8rem;
            }
            body {
                padding: 20px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <a href="#" class="logo">RemyndNow</a>
        </header>

        <main class="card">
            <h1>{{ $CmsPage->title }}</h1>
            <div class="content">
                {!! nl2br(e($CmsPage->body)) !!}
            </div>
        </main>

        <footer class="footer">
            &copy; {{ date('Y') }} RemyndNow. All rights reserved.
        </footer>
    </div>
</body>
</html>
