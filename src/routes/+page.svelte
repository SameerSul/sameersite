<script>
    import { onMount } from 'svelte';

    // --- State ---
    let isDark = true;
    let y = 0;
    let mX = 0, mY = 0;
    let cursorHover = false;

    const experience = [
        {
            company: "Advanced Micro Devices (AMD)",
            role: "Physical Design Engineering Intern (SoC)",
            period: "May 2025 – Jan 2026",
            points: [
                "Designed master tile on Fusion Compiler and closed timing for interposer die on Data Center GPU.",
                "Integrated Python scripts into chip design flow to automate Synopsys PrimeTime STA data extraction.",
                "Developed LangChain LLM agents to automate PD tasks, reducing timing violation resolution time by 40%.",
                "Architected parallelized Python programs reducing memory overhead by 95%."
            ]
        },
        {
            company: "McMaster University (HADI Lab)",
            role: "Research Assistant",
            period: "Sep 2025 – Dec 2025",
            points: [
                "Designed calibration-free BMI decoder using Banditron RL with adaptive channel masking.",
                "Achieved 96% accuracy using only 3 MACs/inference at sub-mW power levels."
            ]
        }
    ];

    function toggleTheme() {
        isDark = !isDark;
        applyTheme();
    }

    function applyTheme() {
        const bgColor = isDark ? "#000000" : "#ffffff";
        const textColor = isDark ? "#71a3c1" : "#000000";
        const borderColor = isDark ? "rgba(113, 163, 193, 0.2)" : "rgba(0, 0, 0, 0.1)";

        // This targets the entire browser window (sides included)
        document.documentElement.style.setProperty('--bg', bgColor);
        document.documentElement.style.setProperty('--text', textColor);
        document.documentElement.style.setProperty('--border', borderColor);
        document.body.style.backgroundColor = bgColor;
    }

    onMount(() => {
        applyTheme();
        window.addEventListener('mousemove', (e) => { mX = e.clientX; mY = e.clientY; });
    });
</script>

<svelte:window bind:scrollY={y} />

<div class="cursor" style="left: {mX}px; top: {mY}px;" class:hovering={cursorHover}></div>

<div class="wrapper">
    <header class="header" class:scrolled={y > 20}>
        <div class="header-inner">
            <h1 class="name">Sameer Suleman</h1>
            
            <button class="toggle" on:click={toggleTheme} on:mouseenter={() => cursorHover = true} on:mouseleave={() => cursorHover = false}>
                {#if isDark}
                    <svg viewBox="0 0 24 24" fill="white">
                        <circle cx="12" cy="12" r="5" />
                        <g stroke="white" stroke-width="2">
                            <line x1="12" y1="1" x2="12" y2="3" /><line x1="12" y1="21" x2="12" y2="23" />
                            <line x1="4.22" y1="4.22" x2="5.64" y2="5.64" /><line x1="18.36" y1="18.36" x2="19.78" y2="19.78" />
                            <line x1="1" y1="12" x2="3" y2="12" /><line x1="21" y1="12" x2="23" y2="12" />
                            <line x1="4.22" y1="19.78" x2="5.64" y2="18.36" /><line x1="18.36" y1="5.64" x2="19.78" y2="4.22" />
                        </g>
                    </svg>
                {:else}
                    <svg viewBox="0 0 24 24" fill="black">
                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" />
                    </svg>
                {/if}
            </button>
        </div>
    </header>

    <main class="content">
        <section class="hero">
            <h2>computer engineering @ mcmaster & ntu singapore.<br>physical design intern @ amd.</h2>
        </section>

        <section class="section">
            <span class="label">01 / experience</span>
            <div class="list">
                {#each experience as job}
                    <div class="item">
                        <div class="item-header">
                            <h3>{job.company}</h3>
                            <span class="date">{job.period}</span>
                        </div>
                        <p class="role">{job.role}</p>
                        <ul>
                            {#each job.points as point}
                                <li>{point}</li>
                            {/each}
                        </ul>
                    </div>
                {/each}
            </div>
        </section>

        <footer class="footer">
            <a href="mailto:sulems6@mcmaster.ca">Email</a>
            <a href="https://linkedin.com/in/Sameer-Sul" target="_blank">LinkedIn</a>
        </footer>
    </main>
</div>

<style>
    :global(:root) {
        --bg: #000000;
        --text: #71a3c1;
        --border: rgba(113, 163, 193, 0.2);
        transition: background-color 0.4s ease;
    }

    :global(body) {
        margin: 0;
        padding: 0;
        background-color: var(--bg);
        color: var(--text);
        font-family: 'Inter', sans-serif;
        cursor: none !important;
    }

    .wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        min-height: 100vh;
    }

    /* Header Centering */
    .header {
        position: fixed; top: 0; width: 100%;
        display: flex; justify-content: center;
        padding: 60px 0; z-index: 100;
        transition: all 0.3s ease;
    }
    .header.scrolled { padding: 20px 0; backdrop-filter: blur(10px); }

    .header-inner {
        display: flex; align-items: center; gap: 25px;
    }

    .name {
        font-size: 4rem; font-weight: 900; letter-spacing: -0.05em; margin: 0;
    }

    .toggle {
        background: none; border: none; padding: 0; width: 40px; height: 40px; cursor: none;
    }

    /* Content Centering */
    .content {
        max-width: 800px; width: 90%;
        padding-top: 250px; padding-bottom: 100px;
        text-align: center;
    }

    .hero h2 { font-size: 2.2rem; line-height: 1.2; margin-bottom: 100px; }

    .section { margin-bottom: 120px; width: 100%; }
    .label { display: block; font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.5em; opacity: 0.5; margin-bottom: 50px; }

    .item { text-align: left; margin-bottom: 60px; }
    .item-header { display: flex; justify-content: space-between; align-items: baseline; border-bottom: 1px solid var(--border); padding-bottom: 10px; }
    .item h3 { font-size: 1.8rem; margin: 0; }
    .role { font-style: italic; margin: 10px 0 20px 0; opacity: 0.8; }

    /* Bullet Point Fix */
    ul { list-style: none; padding: 0; }
    li { position: relative; padding-left: 25px; margin-bottom: 12px; line-height: 1.5; opacity: 0.8; }
    li::before { content: "•"; position: absolute; left: 0; color: var(--text); }

    .footer { display: flex; justify-content: center; gap: 30px; border-top: 1px solid var(--border); padding-top: 50px; }
    .footer a { color: var(--text); text-decoration: none; font-weight: 700; text-transform: uppercase; font-size: 0.8rem; opacity: 0.6; }
    .footer a:hover { opacity: 1; }

    /* Cursor */
    .cursor {
        position: fixed; width: 10px; height: 10px; background: #71a3c1; border-radius: 50%;
        pointer-events: none; z-index: 1000; transform: translate(-50%, -50%);
        transition: width 0.3s, height 0.3s, opacity 0.3s;
    }
    .cursor.hovering { width: 40px; height: 40px; opacity: 0.3; }

    @media (max-width: 768px) {
        .name { font-size: 2rem; }
        .hero h2 { font-size: 1.5rem; }
        .item-header { flex-direction: column; }
    }
</style>