<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $CmsPage->title }} - RemyndNow</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&family=Inter:wght@400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8950FC;
            --primary-light: #f3f0ff;
            --accent: #00D1FF;
            --text-dark: #1e1e2d;
            --text-muted: #5E6278;
            --glass-bg: rgba(255, 255, 255, 0.75);
            --glass-border: rgba(255, 255, 255, 0.4);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: #f0f2f5;
            color: var(--text-dark);
            line-height: 1.7;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        /* Animated Background Mesh */
        .bg-mesh {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: radial-gradient(at 0% 0%, rgba(137, 80, 252, 0.15) 0, transparent 50%),
                        radial-gradient(at 50% 0%, rgba(0, 209, 255, 0.1) 0, transparent 50%),
                        radial-gradient(at 100% 0%, rgba(137, 80, 252, 0.15) 0, transparent 50%),
                        radial-gradient(at 50% 50%, rgba(105, 147, 255, 0.05) 0, transparent 50%);
            animation: meshMove 20s ease infinite alternate;
        }

        @keyframes meshMove {
            0% { transform: scale(1); }
            100% { transform: scale(1.1) rotate(2deg); }
        }

        .blob {
            position: absolute;
            width: 500px;
            height: 500px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            filter: blur(80px);
            opacity: 0.15;
            z-index: -1;
            border-radius: 50%;
            animation: float 25s infinite linear;
        }

        .blob-1 { top: -100px; left: -100px; animation-duration: 30s; }
        .blob-2 { bottom: -100px; right: -100px; animation-duration: 35s; animation-direction: reverse; }

        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(50px, 80px) rotate(120deg); }
            66% { transform: translate(-30px, 50px) rotate(240deg); }
            100% { transform: translate(0, 0) rotate(360deg); }
        }

        .container {
            max-width: 960px;
            margin: 60px auto;
            padding: 0 20px;
            flex: 1;
        }

        .header {
            text-align: center;
            margin-bottom: 60px;
            animation: slideInDown 0.8s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .logo {
            font-size: 2.8rem;
            font-weight: 800;
            color: var(--primary);
            text-decoration: none;
            display: inline-block;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -1px;
        }

        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            border-radius: 40px;
            padding: 80px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
            animation: cardAppear 1.2s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            overflow: hidden;
        }

        .glass-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 40px;
            color: var(--text-dark);
            letter-spacing: -0.5px;
            line-height: 1.2;
        }

        .content {
            font-family: 'Inter', sans-serif;
            font-size: 1.15rem;
            color: var(--text-muted);
            white-space: pre-wrap;
        }

        .footer {
            text-align: center;
            padding: 40px;
            font-size: 0.95rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        @keyframes slideInDown {
            from { opacity: 0; transform: translateY(-40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes cardAppear {
            from { opacity: 0; transform: translateY(100px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        @media (max-width: 768px) {
            .glass-card {
                padding: 40px 25px;
                border-radius: 30px;
            }
            .container {
                margin: 40px auto;
            }
            h1 {
                font-size: 2rem;
            }
            .logo {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="bg-mesh"></div>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="container">
        <header class="header">
            <a href="#" class="logo">RemyndNow</a>
        </header>

        <main class="glass-card">
            <h1>{{ $CmsPage->title }}</h1>
            <div class="content">
                {!! nl2br(e($CmsPage->body)) !!}
            </div>
        </main>

        <footer class="footer">
            &copy; {{ date('Y') }} RemyndNow. Crafted with Excellence.
        </footer>
    </div>
</body>
</html>
