client GPT4o {
    provider openai
    options {
        model gpt-4o
        api_key env.OPENAI_API_KEY
    }
}

function Echo(message: string) -> string {
    client GPT4o
    prompt #"Echo this message back to me: {{message}}"#
}