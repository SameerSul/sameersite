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
      const offset = 100; 
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
    <section id="introPage" class="grid grid-cols-1 lg:grid-cols-2 gap-10 py-8 sm:py-14">
      <div class="flex flex-col lg:justify-center text-center lg:text-left gap-6 md:gap-8 lg:gap-10">
        <h2 class="font-semibold text-4xl sm:text-5xl md:text-6xl lg:text-7xl">
          <span class="relative inline-block group">
            <span 
              bind:this={gradientElement}
              class="font-poppins text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 to-purple-600" 
              class:animate-gradient-x={resetAnimation}
            >
              Sameer Suleman
            </span>
            <span class="absolute -inset-1 bg-gradient-to-r from-indigo-400 to-purple-600 rounded-lg blur opacity-30 group-hover:opacity-100 transition duration-1000 group-hover:duration-200"></span>
          </span>
          <br><br>
          <p class="text-3xl sm:text-4xl md:text-5xl lg:text-6xl">That's me, I'm a...</p>
          <br />
          <div class="title-container">
            <span class="poppins text-indigo-400 title-text">{currentTitle}</span>
          </div>
        </h2>
    
        <button 
          on:click={scrollToAbout}
          class="modern-button mx-auto lg:mr-auto lg:ml-0"
        >
          <span class="button-text">Check Me Out &darr;</span>
        </button>
      </div>

      <div class="flex justify-center md:justify-start space-x-4">
        <div class="relative shadow-2xl grid place-items-center">
          <img src={"images/profile.png"} alt="Profile" class="object-cover z-[2] max-h-[70vh] w-96 h-96 rounded-full"   />
        </div>  
        
        <div class="flex flex-col justify-center space-y-4 ml-4">
          <a href="https://github.com/SameerSul" target="_blank" rel="noopener noreferrer" class="social-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
          </a>
          <a href="https://linkedin.com/in/sameer-sul" target="_blank" rel="noopener noreferrer" class="social-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg>
          </a>
          <a href="https://devpost.com/sameerjuin" target="_blank" rel="noopener noreferrer" class="social-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
          </a>
          <a href="mailto:sameerjuin@gmail.com" class="social-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
          </a>
        </div>
      </div>
    </section>

    <section id="about" class="py-8 sm:py-14">
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

  #about:before {
    content: "";
    display: block;
    height: 100px; /* height of fixed header */
    margin-top: -100px; /* negative height of fixed header */
    visibility: hidden;
  }

  /* Fixed height title container to prevent layout shifts */
  .title-container {
    height: 5rem; /* Fixed height for large screens */
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    overflow: hidden; /* Prevent overflow from affecting layout */
  }

  .title-text {
    display: block;
    line-height: 1.2;
    white-space: nowrap; /* Prevent wrapping */
    overflow: hidden;
    text-overflow: ellipsis; /* Add ellipsis if text is too long */
  }

  @media (min-width: 1024px) {
    .title-container {
      justify-content: flex-start;
      text-align: left;
    }
  }

  @media (max-width: 768px) {
    .title-container {
      height: 3.5rem; /* Smaller fixed height for mobile */
    }
    
    .title-text {
      font-size: 0.9em; /* Slightly smaller text on mobile */
    }
  }

  @media (max-width: 640px) {
    .title-container {
      height: 3rem; /* Even smaller for very small screens */
    }
    
    .title-text {
      font-size: 0.8em;
    }
  }

  /* Modern button styling to match the previous section */
  .modern-button {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    padding: 1rem 2rem;
    border-radius: 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-size: 1.25rem;
    font-weight: 600;
    text-align: center;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    width: auto;
    max-width: 280px;
    transform: translateY(0);
    overflow: hidden;
  }

  .modern-button .button-text {
    position: relative;
    z-index: 2;
    pointer-events: none;
  }

  .modern-button::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 1;
  }

  .modern-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
  }

  .modern-button:hover::before {
    opacity: 1;
  }

  .modern-button:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px rgba(102, 126, 234, 0.4);
  }

  .modern-button:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.5);
  }

  /* Enhanced social icons */
  .social-icon {
    background: linear-gradient(135deg, #64748b 0%, #475569 100%);
    color: white;
    border-radius: 50%;
    padding: 0.75rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    width: 3rem;
    height: 3rem;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    box-shadow: 0 4px 15px rgba(64, 116, 139, 0.3);
    transform: translateY(0);
    position: relative;
    overflow: hidden;
  }

  .social-icon::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 0;
  }

  .social-icon svg {
    position: relative;
    z-index: 1;
  }

  .social-icon:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
  }

  .social-icon:hover::before {
    opacity: 1;
  }

  .social-icon:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px rgba(102, 126, 234, 0.3);
  }

  /* Responsive adjustments */
  @media (max-width: 768px) {
    .modern-button {
      padding: 0.875rem 1.75rem;
      font-size: 1.125rem;
      max-width: 100%;
    }
    
    .social-icon {
      width: 2.5rem;
      height: 2.5rem;
      padding: 0.625rem;
    }
  }
</style>