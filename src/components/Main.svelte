<script>
  import { onMount } from 'svelte';

  // --- Theme Logic (Your original working method) ---
  let isDark = true;
  let pageLoaded = false;
  let y = 0;
  let mX = 0, mY = 0;
  let cursorHover = false;

  const signatureBlue = "#71a3c1";

  function toggleTheme() {
    isDark = !isDark;
    const bgColor = isDark ? "#000000" : "#ffffff";
    // This forces the absolute top-level of the browser to change
    document.documentElement.style.backgroundColor = bgColor;
    document.body.style.backgroundColor = bgColor;
  }

  onMount(() => {
    // Force initial background
    document.documentElement.style.backgroundColor = "#000000";
    document.body.style.backgroundColor = "#000000";
    pageLoaded = true;
    window.addEventListener('mousemove', (e) => { mX = e.clientX; mY = e.clientY; });
  });

  const experience = [
    {
      company: "Advanced Micro Devices (AMD)",
      role: "Physical Design Engineering Intern (SoC)",
      period: "May 2025 – Jan 2026",
      points: [
        "Designed master tile on Fusion Compiler and closed timing for interposer die on Data Center GPU.",
        "Integrated Python scripts to automate Synopsys PrimeTime STA data extraction.",
        "Developed LangChain LLM agents reducing timing violation resolution by 40%.",
        "Architected parallelized Python programs reducing memory overhead by 95%."
      ]
    },
    {
      company: "McMaster University (HADI Lab)",
      role: "Research Assistant",
      period: "Sep 2025 – Dec 2025",
      points: [
        "Designed calibration-free BMI decoder using Banditron RL.",
        "Achieved 96% accuracy using only 3 MACs/inference."
      ]
    }
  ];
</script>

<svelte:window bind:scrollY={y} />

<div class="custom-cursor" style="left: {mX}px; top: {mY}px;" class:hovering={cursorHover}></div>

<div class="centered-layout" class:light-mode={!isDark}>
  
  <header class="header" class:scrolled={y > 20}>
    <div class="header-inner">
      <h1 class="brand-name">Sameer Suleman</h1>
      
      <button class="theme-btn" on:click={toggleTheme} on:mouseenter={() => cursorHover = true} on:mouseleave={() => cursorHover = false}>
        {#if isDark}
          <svg viewBox="0 0 24 24" width="40" height="40">
            <circle cx="12" cy="12" r="5" fill="white" />
            <g stroke="white" stroke-width="2">
              <line x1="12" y1="1" x2="12" y2="3" /><line x1="12" y1="21" x2="12" y2="23" />
              <line x1="4.22" y1="4.22" x2="5.64" y2="5.64" /><line x1="18.36" y1="18.36" x2="19.78" y2="19.78" />
              <line x1="1" y1="12" x2="3" y2="12" /><line x1="21" y1="12" x2="23" y2="12" />
              <line x1="4.22" y1="19.78" x2="5.64" y2="18.36" /><line x1="18.36" y1="5.64" x2="19.78" y2="4.22" />
            </g>
          </svg>
        {:else}
          <svg viewBox="0 0 24 24" width="40" height="40">
            <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" fill="black" />
          </svg>
        {/if}
      </button>
    </div>
  </header>

  <main class="content-container">
    <section class="hero">
      <h2>computer engineering @ mcmaster & ntu singapore.<br>physical design intern @ amd.</h2>
    </section>

    <section class="experience">
      <p class="label">01 / experience</p>
      {#each experience as job}
        <div class="job">
          <div class="job-row">
            <h3>{job.company}</h3>
            <span class="date">{job.period}</span>
          </div>
          <p class="role">{job.role}</p>
          <ul class="single-bullet-list">
            {#each job.points as point}
              <li>{point}</li>
            {/each}
          </ul>
        </div>
      {/each}
    </section>

    <footer class="footer">
      <a href="mailto:sulems6@mcmaster.ca">Email</a>
      <a href="https://linkedin.com/in/Sameer-Sul" target="_blank">LinkedIn</a>
    </footer>
  </main>
</div>

<style>
  /* FORCING GLOBAL BACKGROUND (Fixes the "sides" issue) */
  :global(html), :global(body) {
    margin: 0; padding: 0;
    transition: background-color 0.4s ease;
    cursor: none !important;
    font-family: 'Inter', sans-serif;
  }

  /* Centering the Entire Page */
  .centered-layout {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    color: #71a3c1; /* Default Dark Mode Text */
    transition: color 0.4s ease;
  }

  .centered-layout.light-mode {
    color: #000000; /* Light Mode Text */
  }

  /* Header Centering */
  .header {
    position: fixed; top: 0; width: 100%;
    display: flex; justify-content: center;
    padding: 60px 0; z-index: 1000;
    transition: all 0.3s ease;
  }
  .header.scrolled { padding: 20px 0; backdrop-filter: blur(10px); }
  
  .header-inner {
    display: flex; align-items: center; gap: 30px;
  }

  .brand-name {
    font-size: 5rem; /* Massive size */
    font-weight: 900;
    letter-spacing: -0.05em;
    margin: 0;
  }

  .theme-btn {
    background: none; border: none; padding: 0; cursor: none;
    display: flex; align-items: center;
  }

  /* Content Styling */
  .content-container {
    max-width: 800px; width: 90%;
    padding-top: 300px; padding-bottom: 100px;
    text-align: center;
  }

  .hero h2 {
    font-size: 2.5rem; line-height: 1.2; font-weight: 700;
    margin-bottom: 120px;
  }

  .label { font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.5em; opacity: 0.5; margin-bottom: 60px; }

  /* Job List Styling */
  .job { text-align: left; margin-bottom: 80px; width: 100%; }
  .job-row { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 10px; }
  .job h3 { font-size: 2rem; margin: 0; font-weight: 800; }
  .date { font-family: monospace; opacity: 0.6; }
  .role { font-style: italic; margin-bottom: 25px; font-size: 1.2rem; }

  /* SINGLE BULLET FIX */
  .single-bullet-list {
    list-style: none !important; /* Force browser to remove default bullet */
    padding: 0;
  }
  .single-bullet-list li {
    position: relative;
    padding-left: 25px;
    margin-bottom: 15px;
    line-height: 1.6;
    opacity: 0.8;
  }
  .single-bullet-list li::before {
    content: "•";
    position: absolute;
    left: 0;
    color: inherit; /* Matches the theme color automatically */
  }

  /* Footer */
  .footer { display: flex; justify-content: center; gap: 40px; border-top: 1px solid rgba(113, 163, 193, 0.2); padding-top: 60px; margin-top: 50px; }
  .footer a { color: inherit; text-decoration: none; font-weight: 700; text-transform: uppercase; font-size: 0.8rem; letter-spacing: 0.2em; opacity: 0.6; }
  .footer a:hover { opacity: 1; }

  /* Custom Cursor */
  .custom-cursor {
    position: fixed; width: 12px; height: 12px; background-color: #71a3c1;
    border-radius: 50%; pointer-events: none; z-index: 10000; transform: translate(-50%, -50%);
    transition: width 0.3s, height 0.3s, opacity 0.3s;
  }
  .custom-cursor.hovering { width: 50px; height: 50px; opacity: 0.3; }

  @media (max-width: 768px) {
    .brand-name { font-size: 2.5rem; }
    .hero h2 { font-size: 1.8rem; }
    .job-row { flex-direction: column; }
  }
</style>