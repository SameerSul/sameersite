<script>
  export let y;

  export let tabs = [
      { name: "Info", link: "#about" },
      { name: "Experience", link: "#experience" },    
      { name: "Projects", link: "#projects" },
  ];

  function scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  function scrollToSection(id) {
      const element = document.getElementById(id);
      if (element) {
          const headerOffset = 75; // Adjust this value based on your header height
          const elementPosition = element.getBoundingClientRect().top;
          const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

          window.scrollTo({
              top: offsetPosition,
              behavior: 'smooth'
          });
      }
  }
</script>

<header
  class={"sticky z-[10] top-0 duration-200 w-full flex items-center justify-between border-b border-solid " +
      (y > 0
          ? "py-4 px-6 bg-slate-950/95 backdrop-blur-sm border-violet-950/50 text-lg"
          : "py-8 px-8 bg-transparent border-transparent text-2xl")}>
  
  <!-- Left side - Logo/Name -->
  <div class="flex-shrink-0">
    <h1 class="font-medium cursor-pointer transition-all duration-300 hover:transform hover:scale-105" on:click={scrollToTop}>
        <span class="font-bold poppins bg-gradient-to-r from-indigo-400 to-purple-600 bg-clip-text text-transparent">
          Sameer Suleman
        </span>
    </h1>
  </div>

  <!-- Right side - Navigation -->
  <nav class="flex items-center gap-4">
      {#each tabs as tab, index}
          <button
              class="modern-nav-button"
              on:click={() => scrollToSection(tab.link.slice(1))}
          >
              <span class="nav-button-text">{tab.name}</span>
          </button>
      {/each}
  </nav>
</header>

<style>
/* Maintain cursor style consistency */
:global(html), :global(body) {
  cursor: none !important;
}

:global(*) {
  cursor: none !important;
}

/* Header styling */
header {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

/* Logo hover effect */
h1 {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

h1:hover {
  transform: translateY(-2px);
}

/* Modern navigation buttons matching your design scheme */
.modern-nav-button {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  padding: 0.75rem 1.5rem;
  border-radius: 12px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  font-size: 1rem;
  font-weight: 600;
  text-align: center;
  border: none;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
  transform: translateY(0);
  overflow: hidden;
  min-width: 100px;
}

.nav-button-text {
  position: relative;
  z-index: 2;
  pointer-events: none;
}

.modern-nav-button::before {
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

.modern-nav-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
}

.modern-nav-button:hover::before {
  opacity: 1;
}

.modern-nav-button:active {
  transform: translateY(0);
  box-shadow: 0 2px 10px rgba(102, 126, 234, 0.4);
}

.modern-nav-button:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.5);
}

/* Responsive design */
@media (max-width: 768px) {
  header {
    padding: 1rem !important;
  }
  
  .modern-nav-button {
    padding: 0.625rem 1.25rem;
    font-size: 0.875rem;
    min-width: 80px;
  }
  
  nav {
    gap: 0.5rem;
  }
  
  h1 {
    font-size: 1.5rem;
  }
}

@media (max-width: 640px) {
  .modern-nav-button {
    padding: 0.5rem 1rem;
    font-size: 0.75rem;
    min-width: 70px;
  }
  
  nav {
    gap: 0.25rem;
  }
  
  h1 {
    font-size: 1.25rem;
  }
}

/* Small screens - stack navigation vertically if needed */
@media (max-width: 480px) {
  header {
    flex-direction: column;
    gap: 1rem;
    padding: 1rem !important;
  }
  
  nav {
    width: 100%;
    justify-content: center;
  }
}</style>