<script>
  import { onMount } from 'svelte';

  // --- Data from Resume ---
  const experience = [
    {
      company: "Advanced Micro Devices (AMD)",
      role: "Physical Design Engineering Intern (SoC)",
      period: "May 2025 – Jan 2026",
      points: [
        "Designed master tile on Fusion Compiler and closed timing for interposer die on Data Center GPU.",
        "Integrated Python scripts into chip design flow to automate Synopsys PrimeTime STA data extraction.",
        "Developed LangChain LLM agents to automate PD tasks, reducing timing violation resolution time by 40%.",
        "Architected parallelized Python programs for PrimeTime report processing, reducing memory overhead by 95%."
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
    },
    {
      company: "McMaster Interdisciplinary Satellite Team",
      role: "Firmware Engineer",
      period: "Aug 2024 – Present",
      points: [
        "Programmed ZedBoard FPGA using C++ & FreeRTOS for multi-threaded satellite tasks.",
        "Designed QSPI Firmware drivers in C to interface data acquisition from sensors to memory."
      ]
    }
  ];

  const projects = [
    { 
      name: "Nora", 
      tags: ["Python", "LangChain", "Fusion Compiler"], 
      desc: "AI Agent for Physical Design Automation. Analyzes PrimeTime reports to suggest optimal ECO fixes and auto-generate placement commands." 
    },
    { 
      name: "Hardware JPEG Decompressor", 
      tags: ["Verilog", "VHDL", "FPGA"], 
      desc: "Digital circuits for Dequantization, IDCT, and Colorspace Conversion to upsample image data for VGA display." 
    },
    { 
      name: "VisuAI", 
      tags: ["AI", "Web", "GenAI"], 
      desc: "Audio-to-comic AI generator with LLM-driven storytelling and concept visualization." 
    }
  ];

  const skills = {
    "Languages": ["C", "C++", "Python", "Perl", "TCL", "SystemVerilog", "MATLAB"],
    "Design": ["ASIC", "RTL", "VLSI", "Digital Logic", "Physical Design Flow"],
    "Tools": ["PrimeTime", "Fusion Compiler", "ICC2", "Vivado", "Quartus", "Git"]
  };
  
  let y = 0;
  let isDark = true;
  let pageLoaded = false;
  let mX = 0;
  let mY = 0;
  let cursorHover = false;

  function toggleTheme() {
    isDark = !isDark;
    const color = isDark ? "#000000" : "#ffffff";
    document.documentElement.style.backgroundColor = color;
    document.body.style.backgroundColor = color;
  }

  onMount(() => {
    document.documentElement.style.backgroundColor = "#000000";
    document.body.style.backgroundColor = "#000000";
    pageLoaded = true;
    window.addEventListener('mousemove', (e) => { mX = e.clientX; mY = e.clientY; });
  });
</script>

<svelte:window bind:scrollY={y} />

<div 
  class="custom-cursor" 
  style="left: {mX}px; top: {mY}px;"
  class:hovering={cursorHover}>
</div>

<main class="min-h-screen transition-colors duration-500" class:bg-black={isDark} class:bg-white={!isDark}>
  
  <header 
    class="fixed top-0 w-full z-[100] transition-all duration-300 border-b"
    class:border-transparent={y < 20}
    class:border-zinc-900={isDark && y >= 20}
    class:border-zinc-100={!isDark && y >= 20}
    style="background-color: {isDark ? 'rgba(0,0,0,0.95)' : 'rgba(255,255,255,0.95)'};"
  >
    <div class="max-w-7xl mx-auto px-8 py-6 flex items-center justify-start gap-8">
        <button 
          on:click={toggleTheme}
          on:mouseenter={() => cursorHover = true}
          on:mouseleave={() => cursorHover = false}
          class="theme-btn flex items-center justify-center shrink-0"
        >
          {#if isDark}
            <i class="fa-solid fa-sun"></i>
          {:else}
            <i class="fa-solid fa-moon"></i>
          {/if}
        </button>

        <h1 class="text-4xl font-black tracking-tighter shrink-0" style:color="#71a3c1">
          Sameer Suleman
        </h1>
    </div>
  </header>

  <div 
    class="max-w-4xl mx-auto px-8 pt-48 pb-32 transition-opacity duration-1000" 
    class:opacity-0={!pageLoaded} 
    class:opacity-100={pageLoaded}
  >
    
    <section class="mb-32">
      <p class="text-3xl font-bold leading-tight mb-8" style:color="#71a3c1">
        Computer Engineering at McMaster & NTU Singapore. <br/>Physical Design Intern at AMD.
      </p>
      <p class="text-xl opacity-70 leading-relaxed max-w-2xl" style:color="#71a3c1">
        Specializing in hardware-efficient AI, VLSI design, and SoC physical automation.
      </p>
    </section>

    <section class="mb-32">
      <h3 class="label mb-12">Professional Experience</h3>
      <div class="space-y-20">
        {#each experience as job}
          <div>
            <div class="flex flex-col md:flex-row justify-between items-baseline mb-4">
              <h4 class="font-bold text-2xl" style:color="#71a3c1">{job.company}</h4>
              <span class="text-sm uppercase tracking-widest opacity-50 font-mono" style:color="#71a3c1">{job.period}</span>
            </div>
            <p class="text-lg font-medium mb-6 opacity-90" style:color="#71a3c1">{job.role}</p>
            <ul class="space-y-4">
              {#each job.points as point}
                <li class="text-lg leading-relaxed opacity-70 flex gap-4" style:color="#71a3c1">
                  <span class="opacity-30">•</span> {point}
                </li>
              {/each}
            </ul>
          </div>
        {/each}
      </div>
    </section>

    <section class="mb-32">
      <h3 class="label mb-12">Technical Projects</h3>
      <div class="grid grid-cols-1 gap-8">
        {#each projects as project}
          <div class="p-8 border rounded-sm transition-all" 
               class:border-zinc-900={isDark} class:border-zinc-100={!isDark}
               style:border-left="4px solid #71a3c1">
            <div class="flex justify-between items-start mb-4">
              <h4 class="font-bold text-2xl" style:color="#71a3c1">{project.name}</h4>
              <div class="flex gap-3">
                {#each project.tags as tag}
                  <span class="text-xs uppercase font-black tracking-tighter opacity-40" style:color="#71a3c1">{tag}</span>
                {/each}
              </div>
            </div>
            <p class="text-lg leading-relaxed opacity-70" style:color="#71a3c1">{project.desc}</p>
          </div>
        {/each}
      </div>
    </section>

    <footer class="pt-16 border-t border-zinc-900/10 text-center">
        <a href="mailto:sulems6@mcmaster.ca" class="text-sm uppercase tracking-widest hover:opacity-100 opacity-50 transition-opacity" style:color="#71a3c1">Get in Touch</a>
    </footer>

  </div>
</main>

<style>
  :global(html), :global(body) {
    margin: 0;
    padding: 0;
    width: 100%;
    min-height: 100vh;
    cursor: none !important;
  }

  .custom-cursor {
    position: fixed;
    width: 12px;
    height: 12px;
    background-color: #71a3c1;
    border-radius: 50%;
    pointer-events: none;
    z-index: 9999;
    transform: translate(-50%, -50%);
    transition: transform 0.1s ease-out;
  }

  .theme-btn {
    width: 48px;
    height: 48px;
    border: 1px solid rgba(113, 163, 193, 0.3);
    border-radius: 50%;
    color: #71a3c1;
    transition: all 0.3s ease;
  }

  .theme-btn:hover {
    background-color: #71a3c1;
    color: white;
  }

  .label {
    font-size: 0.8rem;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.5em;
    opacity: 0.6;
    color: #71a3c1;
  }

  .bg-black { background-color: #000000; color: #71a3c1; }
  .bg-white { background-color: #ffffff; color: #71a3c1; }
</style>