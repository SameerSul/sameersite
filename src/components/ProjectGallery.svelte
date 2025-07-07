<script>
  import { fade, fly } from 'svelte/transition';
  import { onMount } from 'svelte';

  export let projects = [
    {
      name: "VisuAI",
      description: "A web-based application that receives audio input about a concept and creates an AI-generated comic with a 200-character story to explain it. This project made it to the Top 10 at Deltahacks 2024.",
      tags: ["Software", "AI"],
      image: "/images/visuAIThumbnail.png",
      color: "from-purple-400 to-pink-500",
      bgColor: "from-purple-500/10 to-pink-500/10",
      icon: "🎨",
      achievement: "Top 10 at Deltahacks 2024",
      links: {
        devpost: "https://devpost.com/software/visuai-ip7jz4",
        github: "https://github.com/vaibhav-gopal/deltahacks10Storybook",
        video: "https://youtu.be/d3m0dhiz1R4"
      }
    },
    {
      name: "Aspectus",
      description: "A 2D RPG game created in Unity, utilizing Google Gemini API to create personalized, adaptive learning experiences through quests, puzzles, and challenges.",
      tags: ["Software", "AI"],
      image: "/images/aspectusThumbnail.png",
      color: "from-indigo-400 to-purple-500",
      bgColor: "from-indigo-500/10 to-purple-500/10",
      icon: "🎮",
      achievement: "AI-Powered Learning",
      links: {
        devpost: "https://devpost.com/software/brainforge-ai-pioneering-future-education-w-adaptive-tech",
        github: "https://github.com/BrainForgeAI",
        video: "https://youtu.be/AKQTWVEM-Xo"
      }
    },
    {
      name: "SurroundSense",
      description: "LiDAR Spatial Mapping System using ToF sensor, utilizing I2C sensor readings with an MSP432E401Y MCU, transmitted to Python Open3D via UART for real-time visualization.",
      tags: ["Hardware", "Hybrid"],
      image: "/images/scanComparison.png",
      color: "from-green-400 to-teal-500",
      bgColor: "from-green-500/10 to-teal-500/10",
      icon: "📡",
      achievement: "Real-time 3D Mapping",
      links: {
        devpost: "https://drive.google.com/file/d/1-tnnsfvPEH4o1Utr4rdNDlYOT58DG-8Y/view?usp=sharing",
        github: "https://github.com/surroundsense",
        video: "https://youtube.com/surroundsense"
      }
    },
    {
      name: "Noma",
      description: "Using Google Vertex AI and React, Noma identifies key details in images, such as landmarks, and provides them to the Cohere Natural Language Processing API to generate accurate recounts of the user's journey in a chronological manner.",
      tags: ["Software", "AI"],
      image: "/images/NomaWebsite.png",
      color: "from-orange-400 to-red-500",
      bgColor: "from-orange-500/10 to-red-500/10",
      icon: "🌍",
      achievement: "AI Journey Mapping",
      links: {
        devpost: "https://devpost.com/software/noma-discover-and-share-your-experience-with-ease",
        github: "https://github.com/nourishnew/travel-buddy",
        video: "https://youtu.be/dP2HI1Re5nY"
      }
    },
    {
      name: "NorthStar",
      description: "Developed an AI assistant leveraging Google Vertex AI and Gemini to optimize students' schedules by receiving GCal data and using time management techniques to enhance productivity.",
      tags: ["Software", "AI"],
      image: "/images/NorthStarTest-Photoroom (1).png",
      color: "from-blue-400 to-cyan-500",
      bgColor: "from-blue-500/10 to-cyan-500/10",
      icon: "⭐",
      achievement: "Productivity Optimization",
      links: {
        devpost: "https://devpost.com/software/northstar-1clb86",
        github: "https://github.com/vaibhav-gopal/northstar",
        video: "https://youtube.com/northstar"
      }
    },
    {
      name: "3 Bit Digital-To-Analog Converter",
      description: "Developed a Digital-to-Analog Converter (DAC) aimed at receiving reliable analog output from digital signals, enhancing understanding of electronic system design.",
      tags: ["Hardware"],
      image: "/images/2Ei4Project5Website.png",
      color: "from-amber-400 to-orange-500",
      bgColor: "from-amber-500/10 to-orange-500/10",
      icon: "🔧",
      achievement: "Circuit Design Excellence",
      links: {
        devpost: "https://drive.google.com/file/d/1ZIJt9F21uh1KzmEv8-aH-9T7eorpKMUl/view?usp=drive_link",
        github: "https://github.com/dac",
        video: "https://youtube.com/dac"
      }
    },
    {
      name: "MOSFET Based XOR Gate",
      description: "Developed a MOSFET-based XOR Gate using CMOS technology, focusing on frequency control with applications in communication systems.",
      tags: ["Hardware"],
      image: "/images/2EI4Project4(2)Website.png",
      color: "from-violet-400 to-purple-500",
      bgColor: "from-violet-500/10 to-purple-500/10",
      icon: "⚡",
      achievement: "CMOS Technology",
      links: {
        devpost: "https://drive.google.com/file/d/1TDPGne9Zpnw2rhvX_AmB4-t-ADJKPicE/view?usp=sharing",
        github: "https://github.com/xor-gate",
        video: "https://youtube.com/xor-gate"
      }
    },
    {
      name: "AC-DC Converter",
      description: "Designed an AC to DC converter circuit for power supply systems, gaining experience in optimizing power conversion circuits.",
      tags: ["Hardware"],
      image: "/images/2EI4Project1Website.png",
      color: "from-rose-400 to-pink-500",
      bgColor: "from-rose-500/10 to-pink-500/10",
      icon: "🔋",
      achievement: "Power Systems Design",
      links: {
        devpost: "https://drive.google.com/file/d/1argB_-xUHWn2UaJjAeLUEVMEjMqW7k7k/view?usp=sharing",
        github: "https://github.com/acdc-converter",
        video: "https://youtube.com/acdc-converter"
      }
    },
    {
      name: "Arduino Nano Powered Gameboy",
      description: "Designed a Gameboy prototype, developed Schematic and PCB completely from scratch, and programmed a time and memory efficient game in C++",
      tags: ["Hardware", "Software", "Hybrid"],
      image: "/images/ArduinoNanoPCB.png",
      color: "from-emerald-400 to-green-500",
      bgColor: "from-emerald-500/10 to-green-500/10",
      icon: "🕹️",
      achievement: "Full System Design",
      links: {
        devpost: "https://devpost.com/gameboy",
        github: "https://github.com/gameboy",
        video: "https://youtube.com/gameboy"
      }
    },
    {
      name: "Square Wave Generator",
      description: "Engineered a custom Square Wave Generator utilizing a 555 Timer IC, complete with 10K and 100K potentiometers for adjustable frequency control. This project deepened my practical understanding of analog circuit design and signal processing from theoretical coursework.",
      tags: ["Hardware"],
      image: "/images/SquareWaveGenPCB.png",
      color: "from-cyan-400 to-blue-500",
      bgColor: "from-cyan-500/10 to-blue-500/10",
      icon: "📊",
      achievement: "Signal Processing",
      links: {
        devpost: "https://devpost.com/square-wave",
        github: "https://github.com/square-wave",
        video: "https://youtube.com/square-wave"
      }
    }
  ];

  function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }

  onMount(() => {
    projects = shuffleArray(projects);
  });

  let selectedTags = new Set();
  let hoveredCard = null;
  let visible = false;

  onMount(() => {
    const timer = setTimeout(() => visible = true, 100);
    return () => clearTimeout(timer);
  });

  $: allTags = ["Hardware", "Software", "Hybrid", "AI"];

  $: filteredProjects = selectedTags.size === 0
    ? projects
    : projects.filter((project) =>
        project.tags.some((tag) => selectedTags.has(tag))
      );

  function toggleTag(tag) {
    if (selectedTags.has(tag)) {
      selectedTags.delete(tag);
    } else {
      selectedTags.add(tag);
    }
    selectedTags = selectedTags;
  }

  function clearTags() {
    selectedTags.clear();
    selectedTags = selectedTags;
  }

  function getDocumentationLink(project) {
    return project.links.devpost || project.links.github || "#";
  }

  function handleCardClick(project) {
    if (project.name !== "Square Wave Generator" && project.name !== "Arduino Nano Powered Gameboy") {
      const link = getDocumentationLink(project);
      if (link !== "#") {
        window.open(link, '_blank');
      }
    }
  }

  function isClickable(project) {
    return project.name !== "Square Wave Generator" && project.name !== "Arduino Nano Powered Gameboy";
  }

  function getTagColor(tag) {
    const colors = {
      "Hardware": "from-amber-400 to-orange-500",
      "Software": "from-blue-400 to-cyan-500",
      "Hybrid": "from-purple-400 to-pink-500",
      "AI": "from-emerald-400 to-green-500"
    };
    return colors[tag] || "from-gray-400 to-gray-500";
  }
</script>

<div class="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-8" id="projects">
  <div class="max-w-7xl mx-auto">
    <!-- Header -->
    <div class="text-center mb-16">
      <h1 class="text-5xl md:text-7xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-cyan-400 bg-clip-text text-transparent mb-6">
        Projects
      </h1>

    </div>

    <!-- Filter Tags -->
    <div class="mb-12 flex flex-wrap justify-center gap-4">
      {#each allTags as tag}
        <button
          class={`px-6 py-3 rounded-full font-medium transition-all duration-300 transform hover:scale-105 ${
            selectedTags.has(tag) 
              ? `bg-gradient-to-r ${getTagColor(tag)} text-white shadow-lg shadow-${tag.toLowerCase()}-500/25` 
              : 'bg-slate-700/50 text-gray-300 hover:bg-slate-600/50 border border-slate-600/50'
          }`}
          on:click={() => toggleTag(tag)}
        >
          {tag}
        </button>
      {/each}
      <button
        class="px-6 py-3 rounded-full bg-gradient-to-r from-red-500 to-pink-500 hover:from-red-600 hover:to-pink-600 text-white font-medium transition-all duration-300 transform hover:scale-105 shadow-lg shadow-red-500/25"
        on:click={clearTags}
      >
        Clear All
      </button>
    </div>

    <!-- Projects Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {#each filteredProjects as project, index (project.name)}
        {#if visible}
          <div
            class="group relative cursor-pointer"
            in:fly={{ y: 50, duration: 600, delay: index * 100 }}
            out:fade={{ duration: 300 }}
            on:mouseenter={() => hoveredCard = index}
            on:mouseleave={() => hoveredCard = null}
            on:click={() => handleCardClick(project)}
          >
            <!-- Glow Effect -->
            <div class={`absolute inset-0 bg-gradient-to-r ${project.color} rounded-2xl blur-sm opacity-0 group-hover:opacity-20 transition-opacity duration-300`}></div>
            
            <!-- Card Container -->
            <div class={`relative bg-gradient-to-br ${project.bgColor} backdrop-blur-sm border border-slate-700/50 rounded-2xl overflow-hidden shadow-2xl transform transition-all duration-300 group-hover:scale-105 group-hover:shadow-3xl h-full flex flex-col`}>
              
              <!-- Achievement Badge -->
              <div class="absolute top-4 right-4 z-10">
                <div class={`px-3 py-1 rounded-full text-xs font-medium bg-gradient-to-r ${project.color} text-white shadow-lg`}>
                  {project.achievement}
                </div>
              </div>

              <!-- Project Image -->
              <div class="relative h-48 overflow-hidden">
                <img 
                  src={project.image} 
                  alt={project.name} 
                  class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
                />
                <div class="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent"></div>
              </div>

              <!-- Card Content -->
              <div class="p-6 flex-grow flex flex-col">
                <!-- Project Icon and Title -->
                <div class="flex items-center space-x-3 mb-4">
                  <div class={`w-12 h-12 rounded-xl bg-gradient-to-r ${project.color} flex items-center justify-center text-white text-xl group-hover:scale-110 transition-transform duration-300`}>
                    {project.icon}
                  </div>
                  <h3 class="text-xl font-bold text-white group-hover:text-transparent group-hover:bg-gradient-to-r group-hover:bg-clip-text group-hover:from-blue-400 group-hover:to-purple-400 transition-all duration-300">
                    {project.name}
                  </h3>
                </div>

                <!-- Description -->
                <p class="text-gray-300 leading-relaxed mb-6 flex-grow">
                  {project.description}
                </p>

                <!-- Tags -->
                <div class="flex flex-wrap gap-2 mb-6">
                  {#each project.tags as tag}
                    <span class={`px-3 py-1 rounded-full text-sm font-medium bg-gradient-to-r ${getTagColor(tag)} text-white shadow-sm`}>
                      {tag}
                    </span>
                  {/each}
                </div>

                <!-- Links -->
                <div class="flex flex-wrap gap-3">
                  {#if getDocumentationLink(project) !== "#"}
                    <a
                      href={getDocumentationLink(project)}
                      target="_blank"
                      class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                      on:click|stopPropagation
                    >
                      <svg class="w-4 h-4 group-hover/link:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path>
                      </svg>
                      <span class="text-sm font-medium">
                        {project.links.devpost && project.links.devpost.includes('devpost') ? 'Devpost' : 'Documentation'}
                      </span>
                    </a>
                  {/if}
                  {#if project.links.github}
                    <a
                      href={project.links.github}
                      target="_blank"
                      class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                      on:click|stopPropagation
                    >
                      <svg class="w-4 h-4 group-hover/link:scale-110 transition-transform" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                      </svg>
                      <span class="text-sm font-medium">GitHub</span>
                    </a>
                  {/if}
                  {#if project.links.video}
                    <a
                      href={project.links.video}
                      target="_blank"
                      class="inline-flex items-center space-x-2 px-4 py-2 bg-slate-700/50 hover:bg-slate-600/50 rounded-lg transition-colors duration-200 text-gray-300 hover:text-white group/link"
                      on:click|stopPropagation
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
        {/if}
      {/each}
    </div>

    <!-- Bottom Statistics -->
    <div class="mt-20 grid grid-cols-1 md:grid-cols-4 gap-6">
      <div class="text-center p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
        <div class="text-3xl font-bold text-blue-400 mb-2">{projects.length}</div>
        <div class="text-gray-300">Total Projects</div>
      </div>
      <div class="text-center p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
        <div class="text-3xl font-bold text-purple-400 mb-2">{projects.filter(p => p.tags.includes('AI')).length}</div>
        <div class="text-gray-300">AI Projects</div>
      </div>
      <div class="text-center p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
        <div class="text-3xl font-bold text-green-400 mb-2">{projects.filter(p => p.tags.includes('Hardware')).length}</div>
        <div class="text-gray-300">Hardware Projects</div>
      </div>
      <div class="text-center p-6 bg-slate-800/50 rounded-2xl border border-slate-700/50">
        <div class="text-3xl font-bold text-cyan-400 mb-2">{projects.filter(p => p.tags.includes('Hybrid')).length}</div>
        <div class="text-gray-300">Hybrid Projects</div>
      </div>
    </div>
  </div>
</div>

<style>
  :global(.group\/link:hover svg) {
    transform: scale(1.1);
  }
</style>