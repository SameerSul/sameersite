<script>
  import { fade, fly } from 'svelte/transition';
  import { onMount } from 'svelte';

  const experiences = [
        {
      role: "SOC Physical Design Engineering Intern",
      company: "Advanced Micro Devices",
      date: "May 2025 - Present",
      description: "Developing more efficient workflows for future MI chip series tapeout, and working on timing path optimization for Non-SI signals.",
      color: "from-red-400 to-pink-500",
      bgColor: "from-red-500/10 to-pink-500/10",
      icon: "⚡",
      status: "Current",
      links: {
        website: "https://www.amd.com/en/blogs/2025/amd-instinct-mi350-series-and-beyond-accelerating-the-future-of-ai-and-hpc.html#:~:text=AMD%20launched%20the%20AMD%20Instinct,performance%20improvement%20over%20ROCm%206.0",
      },
      skills: ["Physical Design", "Timing Optimization", "SOC Design", "Chip Architecture"]
    },
    {
      role: "Firmware Engineer",
      company: "McMaster Interdisciplinary Satellite Team",
      date: "Aug 2024 - Present",
      description: "Developing FPGA-based systems for PRESET satellite's magnetometer, utilizing AMD Vivado to design custom IP core and Vitis for hardware-software co-simulation, programming FPGA using C.",
      color: "from-yellow-400 to-amber-500",
      bgColor: "from-yellow-500/10 to-amber-500/10",
      icon: "🔧",
      status: "Current",
      links: {
        website: "https://mcmasterneudose.ca/",
        video: "https://youtu.be/u9TTuiRCXCU"
      },
      skills: ["FPGA", "AMD Vivado", "Vitis", "C Programming", "Hardware Design"]
    },
    // {
    //   role: "Lead Software Engineer",
    //   company: "Brainforge AI",
    //   date: "Jul 2024 - Dec 2024",
    //   description: "Architected and developed an innovative educational game using Unity, integrating Google's Gemini AI model. Led full-stack development efforts, AI code implementation, and Unity game development.",
    //   color: "from-purple-400 to-indigo-500",
    //   bgColor: "from-purple-500/10 to-indigo-500/10",
    //   icon: "💻",
    //   status: "Current",
    //   links: {
    //     website: "#",
    //     github: "#",
    //     video: "#"
    //   },
    //   skills: ["Unity", "AI Integration", "Full-Stack", "Game Development", "Leadership"]
    // },
    {
      role: "Software Engineering Intern",
      company: "Wewoo",
      date: "May 2024 - Jul 2024",
      description: "Led a cross-functional team of 4 developers to design and implement real-time ride matching algorithms using WebSocket connections and MongoDB geospatial queries, reducing average wait times by 35%.",
      color: "from-blue-400 to-cyan-500",
      bgColor: "from-blue-500/10 to-cyan-500/10",
      icon: "🏢",
      status: "Completed",
      links: {
        website: "",
      },
      skills: ["NestJS", "GraphQL", "WebSockets","MongoDB"]
    }
  ];

  let visible = false;
  let hoveredCard = null;

  onMount(() => {
    const timer = setTimeout(() => visible = true, 100);
    return () => clearTimeout(timer);
  });

  function getStatusColor(status) {
    return status === "Current" ? "bg-emerald-500" : "bg-gray-500";
  }
</script>

<!-- Added ID "experience" to the main container -->
<div id="experience" class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-8">
  <div class="max-w-7xl mx-auto">
    <!-- Header -->
    <div class="text-center mb-16">
      <h1 class="text-5xl md:text-7xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-cyan-400 bg-clip-text text-transparent mb-6">
        Professional Experience
      </h1>
    </div>

    <!-- Timeline -->
    <div class="relative">
      <!-- Timeline Line -->
      <div class="absolute left-1/2 transform -translate-x-1/2 w-1 h-full bg-gradient-to-b from-blue-500 via-purple-500 to-cyan-500 rounded-full opacity-30"></div>
      
      <!-- Experience Cards -->
      <div class="space-y-12">
        {#each experiences as exp, index}
          {#if visible}
            <div
              class="relative transform transition-all duration-700"
              in:fly={{ y: 50, duration: 700, delay: index * 200 }}
              on:mouseenter={() => hoveredCard = index}
              on:mouseleave={() => hoveredCard = null}
            >
              <!-- Timeline Node -->
              <div class="absolute left-1/2 transform -translate-x-1/2 w-6 h-6 bg-gradient-to-r from-blue-500 to-purple-500 rounded-full border-4 border-slate-900 z-10 shadow-lg"></div>
              
              <!-- Experience Card -->
              <div class={`${index % 2 === 0 ? 'md:mr-1/2 md:pr-12' : 'md:ml-1/2 md:pl-12'} w-full`}>
                <div class="relative group cursor-pointer">
                  <div class={`absolute inset-0 bg-gradient-to-r ${exp.color} rounded-2xl blur-sm opacity-0 group-hover:opacity-20 transition-opacity duration-300`}></div>
                  
                  <div class={`relative bg-gradient-to-br ${exp.bgColor} backdrop-blur-sm border border-slate-700/50 rounded-2xl p-8 shadow-2xl transform transition-all duration-300 group-hover:scale-105 group-hover:shadow-3xl`}>
                    <!-- Status Badge -->
                    <div class="absolute top-4 right-4 flex items-center space-x-2">
                      <div class={`w-3 h-3 rounded-full ${getStatusColor(exp.status)} animate-pulse`}></div>
                      <span class={`text-sm font-medium ${exp.status === 'Current' ? 'text-emerald-400' : 'text-gray-400'}`}>
                        {exp.status}
                      </span>
                    </div>

                    <!-- Company Icon -->
                    <div class={`inline-flex items-center justify-center w-16 h-16 rounded-xl bg-gradient-to-r ${exp.color} mb-6 group-hover:scale-110 transition-transform duration-300`}>
                      <div class="text-white text-2xl">
                        {exp.icon}
                      </div>
                    </div>

                    <!-- Content -->
                    <div class="space-y-4">
                      <div>
                        <h3 class="text-2xl font-bold text-white mb-2">
                          {exp.role}
                        </h3>
                        <h4 class={`text-xl font-semibold bg-gradient-to-r ${exp.color} bg-clip-text text-transparent mb-3`}>
                          {exp.company}
                        </h4>
                      </div>

                      <div class="flex items-center space-x-2 text-gray-400">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                        <span class="text-sm font-medium">{exp.date}</span>
                      </div>

                      <p class="text-gray-300 leading-relaxed">
                        {exp.description}
                      </p>

                      <!-- Skills -->
                      <div class="flex flex-wrap gap-2 pt-4">
                        {#each exp.skills as skill}
                          <span class="px-3 py-1 bg-slate-700/50 text-gray-300 rounded-full text-sm border border-slate-600/50">
                            {skill}
                          </span>
                        {/each}
                      </div>

                      <!-- Links -->
                      <div class="flex flex-wrap gap-3 pt-4">
                        {#if exp.links.website && exp.links.website !== "#"}
                          <a
                            href={exp.links.website}
                            class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                          >
                            <svg class="w-4 h-4 group-hover/link:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path>
                            </svg>
                            <span class="text-sm font-medium">Website</span>
                          </a>
                        {/if}
                        {#if exp.links.github && exp.links.github !== "#"}
                          <a
                            href={exp.links.github}
                            class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                          >
                            <svg class="w-4 h-4 group-hover/link:scale-110 transition-transform" fill="currentColor" viewBox="0 0 24 24">
                              <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                            </svg>
                            <span class="text-sm font-medium">GitHub</span>
                          </a>
                        {/if}
                        {#if exp.links.video && exp.links.video !== "#"}
                          <a
                            href={exp.links.video}
                            class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                          >
                            <svg class="w-4 h-4 group-hover/link:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h1.586a1 1 0 01.707.293l2.828 2.828a1 1 0 00.707.293H15M9 10V9a1 1 0 011-1h4a1 1 0 011 1v1M9 10v5a1 1 0 001 1h4a1 1 0 001-1v-5m-6 0h6"></path>
                            </svg>
                            <span class="text-sm font-medium">Video</span>
                          </a>
                        {/if}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          {/if}
        {/each}
      </div>
    </div>

    <!-- Bottom Section -->
    <div class="text-center mt-20 p-8 bg-slate-800/50 rounded-2xl border border-slate-700/50">
      <p class="text-gray-300 max-w-md mx-auto">
        Always excited to take on new challenges.
      </p>
    </div>
  </div>
</div>

<style>
  :global(.group\/link:hover svg) {
    transform: scale(1.1);
  }
  
  :global(.animate-pulse) {
    animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
  }
  
  @keyframes pulse {
    0%, 100% {
      opacity: 1;
    }
    50% {
      opacity: .5;
    }
  }
</style>