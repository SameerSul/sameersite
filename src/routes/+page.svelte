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

  let pageLoaded = false;

  onMount(() => {
    // Small delay to allow CSS transitions to catch
    setTimeout(() => {
        pageLoaded = true;
    }, 50);
  });
</script>

<div 
  class="max-w-3xl mx-auto px-8 pt-48 pb-32 transition-opacity duration-1000 flex flex-col items-center" 
  class:opacity-0={!pageLoaded} 
  class:opacity-100={pageLoaded}
>
  
  <section class="mb-32 text-center flex flex-col items-center">
    <p class="text-3xl font-bold leading-tight mb-8" style:color="#71a3c1">
      Computer Engineering at McMaster & NTU Singapore. <br/>Physical Design Intern at AMD.
    </p>
    <p class="text-xl opacity-70 leading-relaxed max-w-2xl" style:color="#71a3c1">
      Specializing in hardware-efficient AI, VLSI design, and SoC physical automation.
    </p>
  </section>

  <section class="mb-32 w-full flex flex-col items-center">
    <h3 class="label mb-12 text-center">Professional Experience</h3>
    <div class="space-y-20 w-full max-w-2xl text-left">
      {#each experience as job}
        <div>
          <div class="flex flex-col md:flex-row justify-between items-baseline mb-2 border-b border-[rgba(113,163,193,0.2)] pb-2">
            <h4 class="font-bold text-2xl" style:color="#71a3c1">{job.company}</h4>
            <span class="text-sm uppercase tracking-widest opacity-50 font-mono mt-2 md:mt-0" style:color="#71a3c1">{job.period}</span>
          </div>
          <p class="text-lg font-medium mb-6 opacity-90 italic" style:color="#71a3c1">{job.role}</p>
          <ul class="space-y-4">
            {#each job.points as point}
              <li class="text-base leading-relaxed opacity-80 flex gap-4" style:color="#71a3c1">
                <span class="opacity-40 select-none">•</span> 
                <span>{point}</span>
              </li>
            {/each}
          </ul>
        </div>
      {/each}
    </div>
  </section>

  <section class="mb-32 w-full flex flex-col items-center">
    <h3 class="label mb-12 text-center">Technical Projects</h3>
    <div class="grid grid-cols-1 gap-8 w-full max-w-2xl text-left">
      {#each projects as project}
        <div class="p-8 border border-[rgba(113,163,193,0.2)] rounded-sm transition-all hover:border-[rgba(113,163,193,0.6)]" 
             style:border-left="4px solid #71a3c1">
          <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-4 gap-4">
            <h4 class="font-bold text-xl" style:color="#71a3c1">{project.name}</h4>
            <div class="flex flex-wrap gap-3">
              {#each project.tags as tag}
                <span class="text-xs uppercase font-black tracking-tighter opacity-50 bg-[rgba(113,163,193,0.1)] px-2 py-1 rounded" style:color="#71a3c1">{tag}</span>
              {/each}
            </div>
          </div>
          <p class="text-base leading-relaxed opacity-80" style:color="#71a3c1">{project.desc}</p>
        </div>
      {/each}
    </div>
  </section>

  <footer class="pt-16 border-t border-[rgba(113,163,193,0.2)] text-center w-full max-w-2xl">
      <div class="flex justify-center gap-8">
          <a href="mailto:sulems6@mcmaster.ca" class="footer-link">Email</a>
          <a href="https://linkedin.com/in/Sameer-Sul" target="_blank" rel="noopener noreferrer" class="footer-link">LinkedIn</a>
      </div>
  </footer>

</div>

<style>
  .label {
    font-size: 0.85rem;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.5em;
    opacity: 0.6;
    color: #71a3c1;
  }

  .footer-link {
    font-size: 0.8rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.2em;
    color: #71a3c1;
    opacity: 0.5;
    text-decoration: none;
    transition: opacity 0.3s ease;
  }

  .footer-link:hover {
    opacity: 1;
  }
</style>