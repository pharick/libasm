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

	printf("___ft_atoi_base___\n");
	printf("Enter string:\n");
	fgets(str1, 1024, stdin);
	str1[strlen(str1) - 1] = '\0';
	printf("Enter base:\n");
	fgets(str2, 1024, stdin);
	str2[strlen(str2) - 1] = '\0';
	printf("%d\n", ft_atoi_base(str1, str2));
	printf("\n");

	printf("___ft_list_push_front___\n");
	char *d1 = "toremove";
	char *d2 = "toremove";
	char *d3 = "item1";
	char *d4 = "item64";
	char *d5 = "toremove";
	char *d6 = "item42";
	t_list *list = NULL;
	ft_list_push_front(&list, d1);
	ft_list_push_front(&list, d2);
	ft_list_push_front(&list, d3);
	ft_list_push_front(&list, d4);
	ft_list_push_front(&list, d5);
	ft_list_push_front(&list, d6);
	print_list(list);
	printf("\n");

	printf("___ft_list_size___\n");
	printf("list size: %d\n", ft_list_size(list));
	printf("\n");

	printf("___ft_list_remove_if___\n");
	ft_list_remove_if(&list, "toremove", ft_strcmp, free_fct);
	print_list(list);
	printf("\n");

	printf("___ft_list_sort___\n");
	ft_list_sort(&list, ft_strcmp);
	print_list(list);
	printf("\n");

	return (0);
}
