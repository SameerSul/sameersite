<script>
    import { onMount } from 'svelte';

    export let y = 0; // Receive scroll position if needed
    let isDark = true;
    let mX = 0;
    let mY = 0;
    let cursorHover = false;

    function toggleTheme() {
        isDark = !isDark;
        document.documentElement.style.backgroundColor = isDark ? "#000000" : "#ffffff";
        document.body.style.backgroundColor = isDark ? "#000000" : "#ffffff";
    }

    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    onMount(() => {
        document.documentElement.style.backgroundColor = "#000000";
        document.body.style.backgroundColor = "#000000";
        
        const moveCursor = (e) => {
            mX = e.clientX;
            mY = e.clientY;
        };
        
        window.addEventListener('mousemove', moveCursor);
        return () => window.removeEventListener('mousemove', moveCursor);
    });
</script>

<svelte:window bind:scrollY={y} />

<div 
    class="custom-cursor" 
    style="left: {mX}px; top: {mY}px;"
    class:hovering={cursorHover}>
</div>

<div class="min-h-screen transition-colors duration-500 w-full" class:bg-black={isDark} class:bg-white={!isDark}>
    
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

    <slot />

</div>

<style>
    /* Global Reset & Cursor Hide */
    :global(html), :global(body), :global(*) {
        cursor: none !important;
        box-sizing: border-box;
    }

    :global(html), :global(body) {
        margin: 0;
        padding: 0;
        width: 100%;
        overflow-x: hidden;
    }

    /* Theme Colors */
    .bg-black { background-color: #000000; color: #71a3c1; }
    .bg-white { background-color: #ffffff; color: #71a3c1; }

    /* Custom Cursor */
    .custom-cursor {
        position: fixed;
        width: 10px;
        height: 10px;
        background-color: #71a3c1;
        border-radius: 50%;
        pointer-events: none;
        z-index: 9999;
        transform: translate(-50%, -50%);
        transition: transform 0.1s ease-out, width 0.2s, height 0.2s, opacity 0.2s;
    }

    .custom-cursor.hovering {
        width: 35px;
        height: 35px;
        opacity: 0.2;
    }

    /* Header Styles */
    header {
        border-bottom: 1px solid transparent;
    }

    .header-scrolled {
        padding-top: 0.25rem;
        padding-bottom: 0.25rem;
        border-bottom: 1px solid rgba(113, 163, 193, 0.1);
    }

    .logo-text {
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        font-size: 1.1rem;
        color: #71a3c1;
        background: none;
        border: none;
        letter-spacing: -0.02em;
        transition: opacity 0.2s;
        padding: 0;
    }

    .logo-text:hover {
        opacity: 0.7;
    }

    .theme-toggle {
        color: #71a3c1;
        background: none;
        border: none;
        font-size: 0.9rem;
        padding: 4px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: transform 0.2s ease, opacity 0.2s;
        margin-top: 2px;
        opacity: 0.6;
    }

    .theme-toggle:hover {
        opacity: 1;
    }

    .theme-toggle:active {
        transform: scale(0.9);
    }
</style>