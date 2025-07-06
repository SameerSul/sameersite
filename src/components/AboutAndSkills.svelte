<script>
    const skills = [
        { category: 'Programming Languages', items: ['python', 'cpp', 'cs', 'rust', 'javascript', 'matlab'] },
        { category: 'Libraries', items: ['react', 'svelte', 'nodejs', 'flask', 'graphql', 'pytorch', 'sklearn', 'opencv'] },
        { category: 'Software', items: ['unity', 'git', 'docker'] }
    ];

    function scrollToProjects() {
        const projectsSection = document.getElementById('projects');
        if (projectsSection) {
            const offset = 100; 
            const elementPosition = projectsSection.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - offset;
  
            window.scrollTo({
                top: offsetPosition,
                behavior: 'smooth'
            });
        }
    }
</script>

<div class="grid grid-cols-1 md:grid-cols-2 gap-16"> <!-- Responsive grid layout -->
    <div class="mb-8">
        <h2 class="text-5xl font-bold text-white mb-8">About Me</h2>
        <p class="text-2xl text-gray-300 leading-relaxed">
            Hi! I'm Sameer, a 4th-year Computer Engineering student at McMaster University. 
            <br><br>
            I really like AI, HPC, FPGAs and VLSI development.
            <br><br>
            I'm currently working at AMD as a SOC Physical Design Engineering Intern. Really loving it :).
            <br><br>
            If I'm not at work or studying for school, I enjoy building cool software, diving into niche rabbitholes, and working out.
        </p>
        <br>
        <div class="flex flex-col md:flex-row gap-4">
            <button 
                on:click={scrollToProjects}
                class="button-effect"
            >
                <span class="button-text">Projects &darr;</span>
            </button>
            <a href="https://drive.google.com/drive/folders/1c5UVoXO0UxRK_HjOIvRIKYoAXi02ZdaG?usp=sharing" target="_blank" class="button-effect">
                <span class="button-text">View My Resume(s)</span>
            </a>
        </div>
    </div>

    <div>
        <h2 class="text-5xl font-bold text-white mb-8">Skills</h2>
        
        {#each skills as skillCategory}
            <div class="mb-8">
                <h3 class="text-3xl font-semibold text-blue-400 mb-4">{skillCategory.category}</h3>
                <div class="skills-icons">
                    <a href="https://skillicons.dev">
                        <img src={`https://skillicons.dev/icons?i=${skillCategory.items.join(',')}&theme=light&perline=5`} alt="{skillCategory.category} Skills" />
                    </a>
                </div>
            </div>
        {/each}
    </div>
</div>

<style>
    .button-effect {
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
        width: 100%;
        transform: translateY(0);
        overflow: hidden;
    }

    .button-text {
        position: relative;
        z-index: 2;
        pointer-events: none; /* Prevents text from interfering with clicks */
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
        z-index: 1;
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

    /* Focus styles for accessibility */
    .button-effect:focus {
        outline: none;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.5);
    }

    .skills-icons {
        display: inline-block;
        margin-left: 10px;
    }

    h2 {
        font-size: 3rem;
    }

    p {
        font-size: 1.5rem;
    }

    /* Media query for small screens */
    @media (max-width: 768px) {
        .button-effect {
            padding: 0.875rem 1.75rem;
            font-size: 1.125rem;
        }
        
        h2 {
            font-size: 2.5rem;
        }
        
        p {
            font-size: 1.25rem;
        }
    }
</style>