<header
    class="fixed z-[100] top-0 w-full transition-all duration-300"
    class:header-scrolled={y > 20}
    style="background-color: {isDark ? 'rgba(0,0,0,0.8)' : 'rgba(255,255,255,0.8)'}; backdrop-filter: blur(8px);"
>
    <div class="max-w-2xl mx-auto flex items-center justify-center gap-4 py-6 px-6">
        <button 
            on:click={scrollToTop}
            on:mouseenter={() => cursorHover = true}
            on:mouseleave={() => cursorHover = false}
            class="logo-text"
        >
            Sameer Suleman
        </button>

        <button 
            on:click={toggleTheme}
            on:mouseenter={() => cursorHover = true}
            on:mouseleave={() => cursorHover = false}
            class="theme-toggle"
            aria-label="Toggle Theme"
        >
            {#if isDark}
                <i class="fa-solid fa-sun"></i>
            {:else}
                <i class="fa-solid fa-moon"></i>
            {/if}
        </button>
    </div>
</header>