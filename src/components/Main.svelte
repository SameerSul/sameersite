<script>
  import Step from "./Step.svelte";
  import { onMount } from 'svelte';

  import ProjectGallery from './ProjectGallery.svelte';
  import ExperienceTimeline from './ExperienceTimeline.svelte';
  import AboutAndSkills from './AboutAndSkills.svelte';

  let steps = [
    {
      name: "VisuAI",
      description: "A web-based application that receives audio input about a concept and creates an AI Generated comic with a 200-character story to explain it.",
      tags: ["Web", "AI", "Audio Processing", "Comic Generation"]
    },
    {
      name: "Aspectus",
      description: "A 2D RPG game created in Unity, utilizing Google Gemini API. It receives course syllabus/transcript and uses AI to create personalized, adaptive learning experiences through quests, puzzles, and challenges as you play.",
      tags: ["Game Development", "Unity", "AI", "Education"]
    },
    {
      name: "SurroundSense",
      description: "LiDAR Spatial Mapping System using ToF sensor. Utilizing I2C sensor readings are given to an MSP432E401Y MCU and are then transmitted to Python Open3D via UART for real-time visualization.",
      tags: ["Hardware", "LiDAR", "MCU", "Python", "3D Visualization"]
    },
  ];

  let titles = [
    "VLSI/FPGA Enthusiast",
    "Hackathon Enjoyer",
    "Full Stack Developer",
    "Embedded Programmer",
    "Socratica",
  ];

  let currentTitleIndex = 0;
  let currentTitle = titles[currentTitleIndex];
  let resetAnimation = false;
  let gradientElement;

  let pageLoaded = false;
  let showFullContent = false;

  // Cursor Visuals
  let cursor;
  let cursorHoverElements;

  onMount(() => {
    // Cursor Visuals
    cursor = document.querySelector('.custom-cursor');
    cursorHoverElements = document.querySelectorAll('a, button, [role="button"], input, select, textarea, [tabindex]:not([tabindex="-1"])');  
    
    document.addEventListener('mousemove', (e) => {
      cursor.style.left = `${e.clientX}px`;
      cursor.style.top = `${e.clientY}px`;
    });

    cursorHoverElements.forEach((el) => {
      el.addEventListener('mouseenter', () => cursor.classList.add('hover'));
      el.addEventListener('mouseleave', () => cursor.classList.remove('hover'));
      el.classList.add('cursor-hover');
    });

    const interval = setInterval(() => {
      currentTitleIndex = (currentTitleIndex + 1) % titles.length;
      currentTitle = titles[currentTitleIndex];
      resetAnimation = true;
    }, 1750); // Change title duration

    setTimeout(() => {
      pageLoaded = true;
      setTimeout(() => {
        showFullContent = true;
      }, 1750); // Delay before showing full content
    }, 1000); // Delay before starting the transition

    return () => clearInterval(interval);
  });

  function scrollToAbout() {
    const aboutSection = document.getElementById('about');
    if (aboutSection) {
      const offset = 40; // Reduced offset to fix interaction issue
      const elementPosition = aboutSection.getBoundingClientRect().top;
      const offsetPosition = elementPosition + window.pageYOffset - offset;
      
      window.scrollTo({
        top: offsetPosition,
        behavior: 'smooth'
      });
    }
  }

  $: if (resetAnimation) {
    resetAnimation = false;
    setTimeout(() => {
      resetAnimation = true;
    }, 10);
  }
</script>

<main class="relative flex flex-col flex-1 p-4">
  <div class="custom-cursor"></div>
  {#if !showFullContent}
    <div class="fixed inset-0 flex items-center justify-center bg-slate-900 transition-opacity duration-1000"
         class:opacity-100={!pageLoaded}
         class:opacity-0={pageLoaded}>
      <h1 class="text-6xl font-bold text-white transition-all duration-1000"
          class:blur-sm={!pageLoaded}
          class:blur-none={pageLoaded}>
        Sameer Suleman
      </h1>
    </div>
  {/if}

  <div class="transition-opacity duration-1000"
       class:opacity-0={!showFullContent}
       class:opacity-100={showFullContent}>
    <section id="introPage" class="grid grid-cols-1 lg:grid-cols-2 gap-6 py-4 sm:py-8 min-h-screen items-center -mt-16 sm:-mt-20 lg:-mt-24">
      <div class="flex flex-col lg:justify-center text-center lg:text-left gap-6 md:gap-8 lg:gap-10">
        <div class="title-container"> <!-- Fixed height container to prevent layout shift -->
          <h2 class="font-semibold text-4xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-8xl">
            <span class="relative inline-block">
              <span 
                bind:this={gradientElement}
                class="font-poppins text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 to-purple-600" 
                class:animate-gradient-x={resetAnimation}
              >
                Sameer Suleman
              </span>
            </span>
            <br><br>
            <span class="poppins text-indigo-400 title-text text-3xl sm:text-4xl md:text-5xl lg:text-6xl xl:text-7xl">{currentTitle}</span>
          </h2>
        </div>
    
        <button 
          on:click={scrollToAbout}
          class="button-effect mx-auto lg:mr-auto lg:ml-0"
        >
          Check Me Out &darr;
        </button>
      </div>

      <div class="flex justify-center lg:justify-end items-center w-full">
        <div class="flex items-center justify-between w-full max-w-4xl gap-4 ml-0 lg:ml-8"> <!-- Increased max width, reduced gap, added left margin -->
          <div class="relative shadow-2xl grid place-items-center profile-image-container">
            <img src={"images/profile.png"} alt="Profile" class="object-cover z-[2] max-h-[82vh] rounded-full w-88 h-88 sm:w-106 sm:h-106 lg:w-[29rem] lg:h-[29rem] xl:w-[31rem] xl:h-[31rem]" />
          </div>  
          
          <div class="flex flex-col justify-center space-y-4 lg:space-y-5">
            <a href="https://github.com/SameerSul" target="_blank" rel="noopener noreferrer" class="social-icon bg-slate-700 hover:bg-slate-600 text-white rounded-full p-3 lg:p-4 transition-all duration-300 w-12 h-12 lg:w-14 lg:h-14 xl:w-16 xl:h-16 flex items-center justify-center group hover:scale-110 hover:shadow-2xl">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lg:w-7 lg:h-7 xl:w-8 xl:h-8 group-hover:scale-110 transition-transform duration-300"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
            </a>
            <a href="https://linkedin.com/in/sameer-sul" target="_blank" rel="noopener noreferrer" class="social-icon bg-slate-700 hover:bg-slate-600 text-white rounded-full p-3 lg:p-4 transition-all duration-300 w-12 h-12 lg:w-14 lg:h-14 xl:w-16 xl:h-16 flex items-center justify-center group hover:scale-110 hover:shadow-2xl">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lg:w-7 lg:h-7 xl:w-8 xl:h-8 group-hover:scale-110 transition-transform duration-300"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg>
            </a>
            <a href="https://devpost.com/sameerjuin" target="_blank" rel="noopener noreferrer" class="social-icon bg-slate-700 hover:bg-slate-600 text-white rounded-full p-3 lg:p-4 transition-all duration-300 w-12 h-12 lg:w-14 lg:h-14 xl:w-16 xl:h-16 flex items-center justify-center group hover:scale-110 hover:shadow-2xl">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lg:w-7 lg:h-7 xl:w-8 xl:h-8 group-hover:scale-110 transition-transform duration-300"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
            </a>
            <a href="mailto:sameerjuin@gmail.com" class="social-icon bg-slate-700 hover:bg-slate-600 text-white rounded-full p-3 lg:p-4 transition-all duration-300 w-12 h-12 lg:w-14 lg:h-14 xl:w-16 xl:h-16 flex items-center justify-center group hover:scale-110 hover:shadow-2xl">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lg:w-7 lg:h-7 xl:w-8 xl:h-8 group-hover:scale-110 transition-transform duration-300"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
            </a>
          </div>
        </div>
      </div>
    </section>

    <section id="about" class="py-8 sm:py-14 scroll-margin-top">
      <AboutAndSkills />
    </section>

    <section class="py-8 sm:py-14">
      <ExperienceTimeline />
    </section>

    <section class="py-8 sm:py-14">
      <ProjectGallery steps={steps}/>
    </section>
  </div>
</main>

<style>
  .animate-gradient-x {
    background-size: 400%;
    animation: gradient-x 7s ease infinite;
  }

  @keyframes gradient-x {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }

  /* Fixed height container to prevent layout shift */
  .title-container {
    height: auto;
    min-height: 380px; /* Reduced from 450px */
  }

  .title-text {
    display: inline-block;
    min-height: 1.2em; /* Prevents height changes */
  }

  /* Profile image positioning - moved 50px to the left */
  .profile-image-container {
    margin-left: -60px;
  }

  /* Button styles matching AboutAndSkills.svelte */
  .button-effect {
    display: inline-block;
    position: relative;
    padding: 1.25rem 2.5rem;
    border-radius: 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-size: 1.375rem;
    font-weight: 600;
    text-align: center;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    max-width: 350px;
    transform: translateY(0);
    overflow: hidden;
    z-index: 1;
  }

  .button-effect::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: -1;
  }

  .button-effect:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
  }

  .button-effect:hover::before {
    opacity: 1;
  }

  .button-effect:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px rgba(102, 126, 234, 0.4);
  }

  .button-effect:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.5);
  }

  :global(body) {
    cursor: none;
  }

  .custom-cursor {
    position: fixed;
    top: 0;
    left: 0;
    width: 20px;
    height: 20px;
    background-color: white;
    border-radius: 50%;
    pointer-events: none;
    z-index: 9999;
    transform: translate(-50%, -50%);
    transition: width 0.2s, height 0.2s;
  }

  .custom-cursor.hover {
    width: 30px;
    height: 30px;
  }

  .cursor-hover {
    cursor: none;
  }

  /* Better scroll target positioning */
  .scroll-margin-top {
    scroll-margin-top: 40px;
  }

  /* Responsive adjustments */
  @media (max-width: 1024px) {
    .title-container {
      min-height: 340px; /* Reduced from 400px */
    }
    
    .button-effect {
      padding: 1.125rem 2.25rem;
      font-size: 1.25rem;
    }
    
    /* Reset margin on smaller screens to prevent overflow */
    .profile-image-container {
      margin-left: -25px;
    }
  }

  @media (max-width: 768px) {
    .title-container {
      min-height: 300px; /* Reduced from 350px */
    }
    
    .button-effect {
      padding: 1rem 2rem;
      font-size: 1.125rem;
    }
    
    /* Reset margin on mobile */
    .profile-image-container {
      margin-left: 0;
    }
  }

  @media (max-width: 640px) {
    .title-container {
      min-height: 260px; /* Reduced from 300px */
    }
  }
  
</style>