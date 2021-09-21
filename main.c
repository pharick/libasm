/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbelva <cbelva@student.21-school.ru>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/27 22:35:35 by cbelva            #+#    #+#             */
/*   Updated: 2021/02/07 13:27:15 by cbelva           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include "libasm.h"

void	print_list(t_list *begin_list)
{
	while (begin_list) {
		printf("%s\n", begin_list->data);
		begin_list = begin_list->next;
	}
}

void	free_fct(void *data)
{
	return;
}

int		main(void)
{
	char	str1[1024];
	char	str2[1024];
	ssize_t	res;

	printf("___ft_strlen___\n");
	printf("Enter string:\n");
	fgets(str1, 1024, stdin);
	str1[strlen(str1) - 1] = '\0';
	printf("ft_strlen result: %lu\n", ft_strlen(str1));
	printf("strlen result: %lu\n", strlen(str1));
	printf("\n");

	printf("___ft_strcpy___\n");
	printf("Enter string:\n");
	fgets(str1, 1024, stdin);
	str1[strlen(str1) - 1] = '\0';
	printf("ft_strcpy result: %s\n", ft_strcpy(str2, str1));
	printf("dest: %s\n", str2);
	printf("\n");

	printf("___ft_strcmp___\n");
	printf("Enter string 1:\n");
	fgets(str1, 1024, stdin);
	str1[strlen(str1) - 1] = '\0';
	printf("Enter string 2:\n");
	fgets(str2, 1024, stdin);
	str2[strlen(str2) - 1] = '\0';
	printf("ft_strcmp result: %d\n", ft_strcmp(str1, str2));
	printf("strcmp result: %d\n", strcmp(str1, str2));
	printf("\n");

	printf("___ft_strcmp_\\200__\n");
	printf("ft_strcmp result: %d\n", ft_strcmp("\0q", "\200q"));
	printf("strcmp result: %d\n", strcmp("\0q", "\200q"));
	printf("\n");

	printf("___ft_write_ok___\n");
	errno = 0;
	res = ft_write(1, str1, ft_strlen(str1));
	printf("\nft_write res: %ld, errno: %d\n", res, errno);
	errno = 0;
	res = write(1, str1, ft_strlen(str1));
	printf("\nwrite res: %ld, errno: %d\n", res, errno);
	printf("\n");

	printf("___ft_write_error1___\n");
	errno = 0;
	res = ft_write(1, NULL, ft_strlen(str1));
	printf("ft_write res: %ld, errno: %d\n", res, errno);
	errno = 0;
	res = write(1, NULL, ft_strlen(str1));
	printf("write res: %ld, errno: %d\n", res, errno);
	printf("\n");

	printf("___ft_write_error2___\n");
	errno = 0;
	res = ft_write(-1, str1, ft_strlen(str1));
	printf("ft_write res: %ld, errno: %d\n", res, errno);
	errno = 0;
	res = write(-1, str1, ft_strlen(str1));
	printf("write res: %ld, errno: %d\n", res, errno);
	printf("\n");

	printf("___ft_read_ok___\n");
	errno = 0;
	res = ft_read(1, str1, 10);
	str1[res - 1] = '\0';
	printf("ft_read res: %ld, errno: %d\nstr: %s\n", res, errno, str1);
	errno = 0;
	res = read(1, str1, 10);
	str1[res - 1] = '\0';
	printf("read res: %ld, errno: %d\nstr: %s\n", res, errno, str1);
	printf("\n");

	printf("___ft_read_error1___\n");
	errno = 0;
	res = ft_read(1, NULL, 10);
	printf("ft_read res: %ld, errno: %d\n", res, errno);
	errno = 0;
	res = read(1, NULL, 10);
	printf("read res: %ld, errno: %d\n", res, errno);
	printf("\n");

	printf("___ft_read_error1___\n");
	errno = 0;
	res = ft_read(-1, str1, 10);
	printf("ft_read res: %ld, errno: %d\n", res, errno);
	errno = 0;
	res = read(-1, str1, 10);
	printf("read res: %ld, errno: %d\n", res, errno);
	printf("\n");

	printf("___ft_strdup_ok___\n");
	char *dup = ft_strdup("hello");
	printf("%s\n", dup);
	printf("\n");

	return (0);
}
