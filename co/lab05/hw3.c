#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

char* replace_regex(const char* regex_pattern, const char* text, const char* replacement) {
    regex_t regex;
    regmatch_t match;
    size_t buffer_size = strlen(text) * 2 + 1;
    char* buffer = malloc(buffer_size);
    size_t buffer_pos = 0;
    const char* current_pos = text;

    regcomp(&regex, regex_pattern, REG_EXTENDED);

    while (1) {
        if (regexec(&regex, current_pos, 1, &match, 0) == REG_NOMATCH) {
            strcpy(buffer + buffer_pos, current_pos);
            break;
        }

        strncpy(buffer + buffer_pos, current_pos, match.rm_so);
        buffer_pos += match.rm_so;

        strcpy(buffer + buffer_pos, replacement);
        buffer_pos += strlen(replacement);

        current_pos += match.rm_eo;
    }

    regfree(&regex);
    return buffer;
}

int main(int argc, char* argv[]) {
    char* result = replace_regex(argv[1], argv[2], argv[3]);
    printf("%s\n", result);
    free(result);
    return 0;
}
